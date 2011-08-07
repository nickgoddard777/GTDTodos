class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :mailer_set_url_options

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def respond_to_not_found(*types)
    asset = self.controller_name.singularize
    flick = case self.action_name
      when "destroy" then "delete"
      when "promote" then "convert"
      else self.action_name
    end
    if self.action_name == "show"
      # If asset does exist, but is not viewable to the current user..
      if asset.capitalize.constantize.exists?(params[:id])
        flash[:warning] = t(:msg_asset_not_authorized, asset)
      else
        flash[:warning] = t(:msg_asset_not_available, asset)
      end
    else
      flash[:warning] = t(:msg_cant_do, :action => flick, :asset => asset)
    end
    respond_to do |format|
      format.html { redirect_to :action => :index } if types.include?(:html)
      format.js { render(:update) { |page| page.reload } } if types.include?(:js)
      format.xml { render :text => flash[:warning], :status => :not_found } if types.include?(:xml)
    end
  end
end

