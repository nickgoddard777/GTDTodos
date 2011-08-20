# == Schema Information
# Schema version: 20110729213302
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
#  user_id     :integer
#

class Todo < ActiveRecord::Base

  attr_accessible :title, :description, :status, :next_action, :project_id

  belongs_to :project
  belongs_to :user

  validates :title,         :presence => true,
                            :length => { :maximum => 50 }
  validates :status,        :presence => true
end

