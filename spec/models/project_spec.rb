require 'spec_helper'

describe Project do

  before(:each) do
    @user = Factory(:paid_user)
    @attr = { :title=>"Get MOT", :status => "live", :outcome => "Get MOT Certificate"}
  end

  it "should create a new instance given valid examples" do
    @user.projects.create!(@attr)
  end

  it "should require a title" do
    no_title_project = Project.new(@attr.merge(:title => ""))
    no_title_project.should_not be_valid
  end

  it "should reject titles that are too long" do
    long_title = "a" * 51
    long_title_project = Project.new(@attr.merge(:title => long_title))
    long_title_project.should_not be_valid
  end


  it "should require a status" do
    no_status_project = Project.new(@attr.merge(:status => ""))
    no_status_project.should_not be_valid
  end

  it "should require an outcome" do
    no_outcome_project = Project.new(@attr.merge(:outcome => ""))
    no_outcome_project.should_not be_valid
  end

  describe 'user associations' do

    before(:each) do
      @project = @user.projects.create(@attr)
    end

    it 'should have a user attribute' do
      @project.should respond_to(:user)
    end

    it 'should have the right associated user' do
      @project.user_id.should == @user.id
      @project.user.should == @user
    end
  end
end

