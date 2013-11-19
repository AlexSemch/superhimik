require 'spec_helper'

describe "surveys/index" do
  before(:each) do
    assign(:surveys, [
      stub_model(Survey,
        :topic_id => 1,
        :name => "Name",
        :number_of_quesitons => 2,
        :time_to_complete => 3,
        :type => "Type"
      ),
      stub_model(Survey,
        :topic_id => 1,
        :name => "Name",
        :number_of_quesitons => 2,
        :time_to_complete => 3,
        :type => "Type"
      )
    ])
  end

  it "renders a list of surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
