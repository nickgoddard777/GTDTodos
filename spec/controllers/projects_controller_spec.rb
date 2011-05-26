require 'spec_helper'

describe ProjectsController do
  render_views

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
      response.should have_selector("h1", :content => @project.title)
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
end

