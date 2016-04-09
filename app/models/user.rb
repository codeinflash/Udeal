class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :textbooks
	
  #validates_format_of :email,:with => Devise.email_regexp
  #validates_format_of :email, with: /\@binghamton\.edu/, message: 'binghamton.edu'
  #Use config.email_regexp
end
#below command does reset everything!
#rake db:migrate:reset 
#rake db:reset

#below is the heroku command to reset db
#heroku pg:reset DATABASE