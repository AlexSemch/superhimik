require "spec_helper"

describe DimagesController do
  describe "routing" do

    it "routes to #index" do
      get("/dimages").should route_to("dimages#index")
    end

    it "routes to #new" do
      get("/dimages/new").should route_to("dimages#new")
    end

    it "routes to #show" do
      get("/dimages/1").should route_to("dimages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dimages/1/edit").should route_to("dimages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dimages").should route_to("dimages#create")
    end

    it "routes to #update" do
      put("/dimages/1").should route_to("dimages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dimages/1").should route_to("dimages#destroy", :id => "1")
    end

  end
end
