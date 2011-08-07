require 'spec_helper'

describe Role do

  before(:each) do
    @attr = { :name => "admin" }
  end

  it "should create a new instance given valid examples" do
    Role.create!(@attr)
  end

  it "should require a name" do
    no_name_role = Role.new(@attr.merge(:name => ""))
    no_name_role.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 21
    long_name_role = Role.new(@attr.merge(:name => long_name))
    long_name_role.should_not be_valid
  end

  it "should reject duplicate names" do
    Role.create!(@attr)
    role_with_duplicate_name = Role.new(@attr)
    role_with_duplicate_name.should_not be_valid
  end
end

