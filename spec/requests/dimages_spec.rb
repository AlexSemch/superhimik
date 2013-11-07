require 'spec_helper'

describe "Dimages" do

  subject { page }

  describe "show page" do
    let(:dimage) { FactoryGirl.create(:dimage) }
    before { visit dimage_path(dimage) }

  # it { should have_attached_file(dimage.fotka) }
  # it { should validate_attachment_presence(dimage.fotka) }
  end
  
 
end
