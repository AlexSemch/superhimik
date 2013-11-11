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

require 'spec_helper'

describe User do

  before { @user = User.new(nik: "User", pip: "Test Test Testovich", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:nik) }
  it { should respond_to(:pip) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when nik is not present" do
    before { @user.nik = " " }
    it { should_not be_valid }
  end

  describe "when pip is not present" do
    before { @user.pip = " " }
    it { should_not be_valid }
  end

   describe "when nik is too long" do
    before { @user.nik = "a" * 21 }
    it { should_not be_valid }
  end
  
  describe "when nik is already taken" do
  before do
      user_with_same_nik = @user.dup
      user_with_same_nik.nik = @user.nik.upcase
      user_with_same_nik.save
  end

    it { should_not be_valid }
  end

  describe "when password is not present" do
  before do
      	@user = User.new(nik: "Example", pip: "Test Test Testovich",
                       password: " ", password_confirmation: " ")
  		end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
    describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 4 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(nik: @user.nik) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end

   end

   describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
