class RenameCommenterColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :commenter, :commenter_name
  end
end
