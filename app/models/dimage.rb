# == Schema Information
#
# Table name: dimages
#
#  id                 :integer          not null, primary key
#  fotka_file_name    :string(255)
#  fotka_content_type :string(255)
#  fotka_file_size    :integer
#  fotka_updated_at   :datetime
#  flag               :string(255)
#  descr              :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Dimage < ActiveRecord::Base
  has_attached_file :fotka, :styles => { :avatar => "200x200>", :medium => "300x300>", :thumb => "100x100>" }
  validates :fotka, :attachment_presence => true
  validates :flag, :presence => true

end
