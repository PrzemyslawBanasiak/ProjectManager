class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 }
  validates :description,  presence:true
  validates :project_id,  presence:true
end
