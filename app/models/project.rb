# == Schema Information
# Schema version: 20110525063042
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  status     :string(255)
#  outcome    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base

  attr_accessible :title, :status, :outcome

  has_many :todos

  validates   :title,       :presence => true,
                            :length => { :maximum => 50 }
  validates   :status,      :presence => true
  validates   :outcome,     :presence => true
end

