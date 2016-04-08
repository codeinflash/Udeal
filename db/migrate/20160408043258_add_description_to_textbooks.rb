class AddDescriptionToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :description, :string
  end
end
