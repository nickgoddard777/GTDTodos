require 'spec_helper'

describe Todo do
  before(:each) do
    @user = Factory(:paid_user)
    @attr = {:title => "ring garage", :description => "the number for the garage is 09809809", :status => "live", :next_action => true, :project_id => 1}
  end

  it "should create a new instance given valid examples" do
    @user.todos.create!(@attr)
  end

  it "should require a title" do
    no_title_todo = Todo.new(@attr.merge(:title => ""))
    no_title_todo.should_not be_valid
  end

  it "should reject titles that are too long" do
    long_title = "a" * 51
    long_title_todo = Todo.new(@attr.merge(:title => long_title))
    long_title_todo.should_not be_valid
  end

  it "should require a status" do
    no_status_todo = Todo.new(@attr.merge(:status => ""))
    no_status_todo.should_not be_valid
  end

  describe 'user associations' do

    before(:each) do
      @todo = @user.todos.create(@attr)
    end

    it 'should have a user attribute' do
      @todo.should respond_to(:user)
    end

    it 'should have the right associated user' do
      @todo.user_id.should == @user.id
      @todo.user.should == @user
    end
  end
end

