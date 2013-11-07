require 'spec_helper'

describe "dimages/new" do
  before(:each) do
    assign(:dimage, stub_model(Dimage,
      :fotka => "",
      :flag => "для слайдшоу",
      :descr => "MyText"
    ).as_new_record)
  end

  it "renders new dimage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dimages_path, "post" do
      assert_select "input#dimage_fotka[name=?]", "dimage[fotka]"
      assert_select "input#dimage_flag__[name=?]", "dimage[flag]"
      assert_select "textarea#dimage_descr[name=?]", "dimage[descr]"
    end
  end
end
