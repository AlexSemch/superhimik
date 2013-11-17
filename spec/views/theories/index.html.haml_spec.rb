require 'spec_helper'

describe "theories/index" do
  before(:each) do
    assign(:theories, [
      stub_model(Theory,
        :topic_id => 1,
        :name => "Name",
        :theory_text => "MyText"
      ),
      stub_model(Theory,
        :topic_id => 1,
        :name => "Name",
        :theory_text => "MyText"
      )
    ])
  end

  it "renders a list of theories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
