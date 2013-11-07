require 'spec_helper'

describe "dimages/show" do
  before(:each) do
    @dimage = assign(:dimage, stub_model(Dimage,
      :fotka => "",
      :flag => "Flag",
      :descr => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
