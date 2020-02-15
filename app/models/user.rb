class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :follower_projects
  has_many :donations
  has_many :following_projects, through: :follower_projects
  has_many :payments, through: :donations


  # def follow(project)
  #   follower_projects << project
  # end

  # def unfollow(project)
  #   following.delete(project)
  # end

  # def following?(project)
  #   following.include?(project)
  # end


  def follow(project)
    follower_project.create(project_id: project.id)
  end

  def unfollow(project)
    follower_projec.find_by(project_id: project.id).destroy
  end

  def following?(project)
    project.followers.find_by(id: id).present?
  end

  def follows
    projects
  end

end
