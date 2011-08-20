# == Schema Information
# Schema version: 20110729213302
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base

  has_many :users

  attr_accessible :name

  validates   :name,      :presence => true,
                          :length => { :maximum => 20 },
                          :uniqueness => { :case_sensitive => false }
end

