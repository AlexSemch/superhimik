# == Schema Information
#
# Table name: settings
#
#  id          :integer          not null, primary key
#  system_name :string(255)
#  nav_year    :string(255)
#  footer      :string(255)
#  about_as    :text
#  contact_as  :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Setting < ActiveRecord::Base
end
