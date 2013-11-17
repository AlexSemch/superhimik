require 'spec_helper'

describe "theories/show" do
  before(:each) do
    @theory = assign(:theory, stub_model(Theory,
      :topic_id => 1,
      :name => "Name",
      :theory_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
