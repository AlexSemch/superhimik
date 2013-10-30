require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.pip) }
    it { should have_title(user.pip) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content( I18n.t(:sign_up))  }
    it { should have_title(full_title(I18n.t(:sign_up))) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { I18n.t(:create_user) }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in I18n.t(:nik),          with: "Tets"
        fill_in I18n.t(:pip),          with: "Test Test Testovich"
        fill_in I18n.t(:grade),        with: 11
        fill_in I18n.t(:password),     with: "foobar"
        fill_in I18n.t(:confirmation), with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
	end
end