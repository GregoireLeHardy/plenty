class FollowerProject < ApplicationRecord
  belongs_to :user
  belongs_to :following_projects, class_name: 'Project', foreign_key: 'project_id'


  validates :project_id, uniqueness: { scope: :user_id }
end
