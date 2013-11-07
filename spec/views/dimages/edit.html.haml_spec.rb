require 'spec_helper'

describe "dimages/edit" do
  before(:each) do
    @dimage = assign(:dimage, stub_model(Dimage,
      :fotka => "",
      :flag => "для слайдшоу",
      :descr => "MyText"
    ))
  end

  it "renders the edit dimage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dimage_path(@dimage), "post" do
      assert_select "input#dimage_fotka[name=?]", "dimage[fotka]"
      assert_select "input#dimage_flag__[name=?]", "dimage[flag]"
      assert_select "textarea#dimage_descr[name=?]", "dimage[descr]"
    end
  end
end
