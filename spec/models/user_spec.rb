require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :email => "test@test.com", :password => "test1234", :password_confirmation => "test1234" }
  end

  describe 'project associations' do

    before(:each) do
      @user = User.create(@attr)
    end

    it 'should have a project attribute' do
      @user.should respond_to(:projects)
    end
  end

  describe 'todo associations' do
    before(:each) do
      @user = User.create(@attr)
    end

    it 'should have a todo attribute' do
      @user.should respond_to(:todos)
    end
  end
end

