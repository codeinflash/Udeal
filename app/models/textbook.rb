class Textbook < ActiveRecord::Base

	searchable do
    	text :title, :default_boost => 2
    	text :subject
  	end

	#include ActiveModel::Validations
	validates :title, :presence => true
	validates :subject, :presence => true
	validates :price, :presence => true
	validates :offer, :presence => false
	validates :user_email, :presence => true
	validates :description, :presence => true

	belongs_to :user

end
