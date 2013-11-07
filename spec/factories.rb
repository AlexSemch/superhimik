 include ActionDispatch::TestProcess
FactoryGirl.define do
   factory :user do
    nik    "test"
    pip    "Test Test Testovich"
    grade   11 
    password "foobar"
    password_confirmation "foobar"
  end
  factory :dimage do
    fotka  { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
    flag   "for_slide"
    descr   "Some descr" 
  end
end