FactoryGirl.define do
  factory :user do
    nik    "test"
    pip    "Test Test Testovich"
    grade   11 
    password "foobar"
    password_confirmation "foobar"
  end
end