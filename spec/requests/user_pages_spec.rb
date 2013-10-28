require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content( I18n.t(:sign_up))  }
    it { should have_title(full_title(I18n.t(:sign_up))) }
  end
end