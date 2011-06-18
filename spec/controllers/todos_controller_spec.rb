require 'spec_helper'

describe TodosController do
  render_views

  describe "GET 'index'" do

    before(:each) do
      @todo = Factory(:todo)
      second = Factory(:todo)
      third = Factory(:todo)

      @todos = [@todo, second, third]

      30.times do
        @todos << Factory(:todo, :title => Factory.next(:title))
      end

      get :index
    end

    it 'should be successful' do
      response.should be_success
    end

    it 'should have the right title' do
      response.should have_selector("title", :content => "All Actions")
    end

    it 'should have an element for each todo' do
      @todos[0..2].each do |todo|
        response.should have_selector("td", :content => todo.title)
      end
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @todo = Factory(:todo)
    end

    it "should be successful" do
      get :show, :id => @todo
      response.should be_success
    end

    it "should find the right todo" do
      get :show, :id => @todo
      assigns(:todo).should == @todo
    end

    it 'should display the correct title' do
      get :show, :id => @todo
      response.should have_selector("title", :content => @todo.title)
    end

    it 'should display the todos title' do
      get :show, :id => @todo
      response.should have_selector("h2", :content => @todo.title)
    end
  end

  describe "GET 'new'" do
    it "should be sucessful" do
      get 'new'
      response.should be_success
    end

    it "should have the right page title" do
      get 'new'
      response.should have_selector("title", :content => "New Action")
    end

    it 'should have the label title' do
      get 'new'
      response.should have_selector("label", :content => "Title")
    end
  end

  describe "POST 'create'" do

    describe 'failure' do
      before(:each) do
        @attr = { :title => "", :status => "", :description => "", :next_action => "", :project_id => "" }
      end

      it 'should not create a todo' do
        lambda do
          post :create, :todo => @attr
        end.should_not change(Todo, :count)
      end

      it 'should have the right title' do
        post :create, :todo => @attr
        response.should have_selector("title", :content => "New Action")
      end

      it 'should render the new page' do
        post :create, :todo => @attr
        response.should render_template('new')
      end
    end

    describe 'success' do
      before(:each) do
        @project = Factory(:project)
        @attr = { :title => "create app", :status => "live", :description => "a finished app", :next_action => true, :project_id => @project }
      end

      it 'should create a todo' do
        lambda do
          post :create, :todo => @attr
        end.should change(Todo, :count).by(1)
      end

      it 'should redirect to the todo show page' do
        post :create, :todo => @attr
        response.should redirect_to(todo_path(assigns(:todo)))
      end

      it 'should have todo created message' do
        post :create, :todo => @attr
        flash[:success].should =~ /Action created successfully/i
      end
    end
  end
end

