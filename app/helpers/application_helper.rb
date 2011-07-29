module ApplicationHelper

  def title
    base_title = "GTDTodos"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def menuoption
    @menuoption ||= "home"
    menuoption = @menuoption
  end

end

