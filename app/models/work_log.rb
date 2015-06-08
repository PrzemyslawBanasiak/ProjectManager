class WorkLog < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  validates :task_id,  presence:true
  validates :user_id,  presence:true
  validates :value,  presence:true
end
