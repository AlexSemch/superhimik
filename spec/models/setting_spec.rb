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

require 'spec_helper'

describe Setting do
  pending "add some examples to (or delete) #{__FILE__}"
end
