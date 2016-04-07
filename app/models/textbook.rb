class Textbook < ActiveRecord::Base

	validates :title, :presence => true
	validates :subject, :presence => true
	validates :price, :presence => true
	validates :offer, :presence => false

	belongs_to :user

end
