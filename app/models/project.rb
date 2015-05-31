class Project < ActiveRecord::Base
  before_save :default_values
  validates :name,  presence: true, uniqueness: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }

  def default_values
    self.avatarFileName  ||= 'projectAvatar.png'
  end

end
