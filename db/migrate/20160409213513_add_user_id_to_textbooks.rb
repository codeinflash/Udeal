class AddUserIdToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :user_id, :integer
  end
end
