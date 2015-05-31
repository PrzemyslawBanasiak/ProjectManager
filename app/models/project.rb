class Project < ActiveRecord::Base
  before_save :default_values

  def default_values
    self.avatarFileName  ||= 'projectAvatar.png'
  end

end
