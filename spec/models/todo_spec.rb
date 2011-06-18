require 'spec_helper'

describe Todo do
  before(:each) do
    @attr = {:title => "ring garage", :description => "the number for the garage is 09809809", :status => "live", :next_action => true, :project_id => 1}
  end

  it "should create a new instance given valid examples" do
    Todo.create!(@attr)
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
end

