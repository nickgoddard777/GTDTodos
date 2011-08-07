require 'spec_helper'

describe ProjectsController do
  render_views
  login_paid_user

  describe "GET 'new'" do
    it "should be sucessful" do
      get 'new'
      response.should be_success
    end

    it "should have the right page title" do
      get 'new'
      response.should have_selector("title", :content => "New project")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @project = Factory(:project)
    end

    it "should be successful" do
      get :show, :id => @project
      response.should be_success
    end

    it "should find the right project" do
      get :show, :id => @project
      assigns(:project).should == @project
    end

    it "should have the right title" do
      get :show, :id => @project
      response.should have_selector("title", :content => @project.title)
    end

    it "should include the project's title" do
      get :show, :id => @project
      response.should have_selector("h2", :content => @project.title)
    end

    it "should include the project's status" do
      get :show, :id => @project
      response.should have_selector("p", :content => @project.status)
    end

    it "should include the project's outcome" do
      get :show, :id => @project
      response.should have_selector("p", :content => @project.outcome)
    end
  end

  describe "POST 'create'" do

    describe 'failure' do
      before(:each) do
        @attr = { :title => "", :status => "", :outcome => "" }
      end

      it 'should not create a project' do
        lambda do
          post :create, :project => @attr
        end.should_not change(Project, :count)
      end

      it 'should have the right title' do
        post :create, :project => @attr
        response.should have_selector("title", :content => "New project")
      end

      it 'should render the new page' do
        post :create, :project => @attr
        response.should render_template('new')
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { :title => "create app", :status => "live", :outcome => "a finished app" }
      end

      it 'should create a project' do
        lambda do
          post :create, :project => @attr
        end.should change(Project, :count).by(1)
      end

      it 'should redirect to the project show page' do
        post :create, :project => @attr
        response.should redirect_to(project_path(assigns(:project)))
      end

      it 'should have project created message' do
        post :create, :project => @attr
        flash[:success].should =~ /Project created successfully/i
      end
    end
  end

  describe "GET 'edit'" do

    before(:each) do
      @project = Factory(:project)
      get :edit, :id => @project
    end

    it 'should be successful' do
      response.should be_success
    end

    it 'should have the right title' do
      response.should have_selector("title", :content => "Edit project")
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @project = Factory(:project)
    end

    describe 'failure' do

      before(:each) do
        @attr = { :title => "", :status => "", :outcome => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @project, :project => @attr
        response.should render_template('edit')
      end

      it "should have the right title" do
        put :update, :id => @project, :project => @attr
        response.should have_selector("title", :content => "Edit project")
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :title => "create app", :status => "live", :outcome => "a finished app" }
      end

      it "should change the project's attributes" do
        put :update, :id => @project, :project => @attr
        @project.reload
        @project.title.should  == @attr[:title]
        @project.status.should == @attr[:status]
        @project.outcome.should == @attr[:outcome]
      end

      it "should redirect to the project show page" do
        put :update, :id => @project, :project => @attr
        response.should redirect_to(project_path(@project))
      end

      it "should have a flash message" do
        put :update, :id => @project, :project => @attr
        flash[:success].should =~ /updated/
      end
    end
  end

  describe "GET 'index'" do

    before(:each) do
      @project = Factory(:project)
      second = Factory(:project)
      third = Factory(:project)

      @projects = [@project, second, third]

      30.times do
        @projects << Factory(:project, :title => Factory.next(:title))
      end

      get :index
    end

    it 'should be successful' do
      response.should be_success
    end

    it 'should have the right title' do
      response.should have_selector("title", :content => "All projects")
    end

    it 'should have an element for each product' do
      @projects[0..2].each do |project|
        response.should have_selector("td", :content => project.title)
      end
    end
  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @project = Factory(:project)
    end

    it 'should destroy the project' do
      lambda do
        delete :destroy, :id => @project
      end.should change(Project, :count).by(-1)
    end

    it 'should redirect to the projects page' do
      delete :destroy, :id => @project
      response.should redirect_to(projects_path)
    end
  end
end

