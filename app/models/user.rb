# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  nik             :string(255)
#  pip             :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  grade           :integer
#  created_at      :datetime
#  updated_at      :datetime
#
require "unicode"
class User < ActiveRecord::Base
	validates :nik, presence: true, length: { minimum: 4, maximum: 20}, uniqueness: { case_sensitive: false }
	validates :pip, presence: true, length: { minimum: 10}
 	

 	before_save { |user| user.pip = pip.split.map{|elem| elem.capitalize }.join(' ') }
 	has_secure_password
 	validates :password, length: { minimum: 5 }








	
end
