class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 }
  validates :description,  presence:true
  validates :project_id,  presence:true

  before_save :default_values
  def default_values
    self.task_state  ||= 0
  end

  def task_state_name
    if self.task_state == 0
      return "To Do"
    elsif self.task_state == 1
      return "In Progess"
    elsif self.task_state == 2
      return "Done"
    else
      return "Undefined"
    end
  end
end
