# == Schema Information
# Schema version: 20110607225910
#
# Table name: todos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  next_action :boolean
#  status      :string(255)
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Todo < ActiveRecord::Base

  attr_accessible :title, :description, :status, :next_action, :project_id

  belongs_to :project

  validates :title,         :presence => true,
                            :length => { :maximum => 50 }
  validates :status,        :presence => true
end

