module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:admin)
      @user.confirm!
      sign_in @user
    end
  end

  def login_paid_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:paid_user)
      @user.confirm!
      sign_in @user
    end
  end
end

