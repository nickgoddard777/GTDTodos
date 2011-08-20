# == Schema Information
# Schema version: 20110729213302
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  status     :string(255)
#  outcome    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Project < ActiveRecord::Base

  attr_accessible :title, :status, :outcome

  has_many :todos
  belongs_to :user

  validates   :title,       :presence => true,
                            :length => { :maximum => 50 }
  validates   :status,      :presence => true
  validates   :outcome,     :presence => true
  validates   :user_id,     :presence => true
end

