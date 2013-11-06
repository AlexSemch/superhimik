require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content(I18n.t(:sign_in)) }
    it { should have_title(I18n.t(:sign_in)) }
  end

  describe "signin" do
    before { visit signin_path }

     describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in :session_nik,      with: user.nik
        fill_in :session_password, with: user.password
        click_button I18n.t(:sign_in)
      end

      it { should have_title(user.pip) }
      it { should have_link(I18n.t(:profile),     href: user_path(user)) }
      it { should have_link(I18n.t(:sign_out),    href: signout_path) }
      it { should_not have_link(I18n.t(:sign_in), href: signin_path) }
      describe "followed by signout" do
        before { click_link I18n.t(:sign_out) }
        it { should have_link(I18n.t(:sign_in)) }
      end
    end

    describe "with invalid information" do
      before { click_button I18n.t(:sign_in) }

      it { should have_title(I18n.t(:sign_in)) }
      it { should have_selector('div.alert.alert-danger') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-danger') }
      end

    end

  end
end