require 'spec_helper'

describe "Static pages" do

  describe "about page" do

    it "should have the content 'about_pr'" do
      visit '/static_pages/about'
      expect(page).to have_content(I18n.t(:about_pr))
    end

    it "should have title 'about_pr'" do
      visit '/static_pages/about'
      expect(page).to have_title(I18n.t(:superhimik) + ' | ' + I18n.t(:about_pr))
    end

  end

  describe "contact page" do

    it "should have the content 'contact_as'" do
      visit '/static_pages/contact'
      page.should have_content(I18n.t(:contact_as))
    end

    it "should have the title 'contact_as'" do
      visit '/static_pages/contact'
      page.should have_title(I18n.t(:superhimik) + ' | ' + I18n.t(:contact_as))
    end
  end

  describe "home page" do

      it "should have the  rigth title" do
        visit '/static_pages/home'
        page.should have_title(I18n.t(:superhimik))
      end
      it "should not have a custom page title" do
        visit '/static_pages/home'
        expect(page).not_to have_title('| Home')
    end
  end

end