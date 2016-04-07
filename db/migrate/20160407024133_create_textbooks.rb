class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :title
      t.string :subject
      t.integer :price
      t.boolean :offer
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
