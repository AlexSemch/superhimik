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
        fill_in :user_nik,                    with: "Tets"
        fill_in :user_pip,                    with: "Test Test Testovich"
        select '11',                          from: :user_grade
        fill_in :user_password,               with: "foobar"
        fill_in :user_password_confirmation,  with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(nik: 'Tets') }

        it { should have_link(I18n.t(:sign_out)) }
        it { should have_title(user.pip) }
        it { should have_selector('div.alert.alert-success') }
      end
    end
	end
end