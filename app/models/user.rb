# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  nik                 :string(255)
#  pip                 :string(255)
#  password_digest     :string(255)
#  admin               :boolean          default(FALSE)
#  grade               :integer
#  created_at          :datetime
#  updated_at          :datetime
#  remember_token      :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require "unicode"
class User < ActiveRecord::Base
	validates :nik, presence: true, length: { minimum: 4, maximum: 20}, uniqueness: { case_sensitive: false }
	validates :pip, presence: true, length: { minimum: 10}
 	
	before_save { |user| user.nik = nik.strip }
 	before_save { |user| user.pip = pip.split.map{|elem| elem.capitalize }.join(' ') }
 	before_create :create_remember_token
 	has_secure_password
	validates :password, length: { minimum: 5 }
	has_attached_file :avatar, :styles => { :avatar => "300x300>", :mini_avatar => "50x50>" }
	# validates_attachment :avatar, :content_type => { :content_type => "image/jpg", :content_type => "image/png" }
 	
 	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

	    def create_remember_token
	      self.remember_token = User.encrypt(User.new_remember_token)
	    end





	
end
