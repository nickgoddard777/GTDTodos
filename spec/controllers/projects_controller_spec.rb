require 'spec_helper'

describe ProjectsController do
  render_views
  login_paid_user



  describe "GET 'index'" do

    before(:each) do
      @user2 = Factory(:paid_user)
      @project = Factory(:project, :user => @user)
      @second = Factory(:project, :user => @user2, :title => "User 2 project")
      third = Factory(:project, :user => @user)

      @projects = [@project, @second, third]

      30.times do
        @projects << Factory(:project, :title => Factory.next(:title), :user => @user)
      end

      get :index
    end

    it 'should be successful' do
      response.should be_success
    end

    it 'should have the right title' do
      response.should have_selector("title", :content => "All projects")
    end

    it 'should not have an element for user2s project' do
      response.should_not have_selector("td", :content => @second.title)
    end

    it 'should have an element for each product' do
      @projects[2..4].each do |project|
        response.should have_selector("td", :content => project.title)
      end
    end
  end

end

