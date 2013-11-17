require 'spec_helper'

describe "theories/new" do
  before(:each) do
    assign(:theory, stub_model(Theory,
      :topic_id => 1,
      :name => "MyString",
      :theory_text => "MyText"
    ).as_new_record)
  end

  it "renders new theory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theories_path, "post" do
      assert_select "input#theory_topic_id[name=?]", "theory[topic_id]"
      assert_select "input#theory_name[name=?]", "theory[name]"
      assert_select "textarea#theory_theory_text[name=?]", "theory[theory_text]"
    end
  end
end
