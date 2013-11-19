require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :topic_id => 1,
      :name => "MyString",
      :number_of_quesitons => 1,
      :time_to_complete => 1,
      :type => ""
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", surveys_path, "post" do
      assert_select "input#survey_topic_id[name=?]", "survey[topic_id]"
      assert_select "input#survey_name[name=?]", "survey[name]"
      assert_select "input#survey_number_of_quesitons[name=?]", "survey[number_of_quesitons]"
      assert_select "input#survey_time_to_complete[name=?]", "survey[time_to_complete]"
      assert_select "input#survey_type[name=?]", "survey[type]"
    end
  end
end
