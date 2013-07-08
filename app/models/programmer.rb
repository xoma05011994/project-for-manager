class Programmer < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :programmer_projects
  has_many :projects, through: :programmer_projects

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
