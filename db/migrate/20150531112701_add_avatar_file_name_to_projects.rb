class AddAvatarFileNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :avatarFileName, :string
  end
end
