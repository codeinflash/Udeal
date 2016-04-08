class AddUserEmailToTextbooks < ActiveRecord::Migration
  def change
    add_column :textbooks, :user_email, :string
  end
end

#below command did!
#rails g migration add_user_email_to_textbooks user_email:string