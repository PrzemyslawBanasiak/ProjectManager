class Project < ActiveRecord::Base
  has_many :tasks
  attr_accessor :start_time, :end_time
  before_save :default_values, :set_datetimes
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }

  def default_values
    self.avatarFileName  ||= 'projectAvatar.png'
  end

  def get_datetimes
    puts self.start_time
    #self.start_time = DateTime.strftime(self.start_time, "%m/%d/%Y") 
  end

  def set_datetimes
    self.start_time = Time.strptime(self.start_time, "%m/%d/%Y").to_time()
    self.end_time = Time.strptime(self.end_time, "%m/%d/%Y").to_time()
    puts end_time
    puts start_time
  end
end
