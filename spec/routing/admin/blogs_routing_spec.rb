require "spec_helper"

describe Admin::BlogsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/blogs").should route_to("admin/blogs#index")
    end

    it "routes to #new" do
      get("/admin/blogs/new").should route_to("admin/blogs#new")
    end

    it "routes to #show" do
      get("/admin/blogs/1").should route_to("admin/blogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/blogs/1/edit").should route_to("admin/blogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/blogs").should route_to("admin/blogs#create")
    end

    it "routes to #update" do
      put("/admin/blogs/1").should route_to("admin/blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/blogs/1").should route_to("admin/blogs#destroy", :id => "1")
    end

  end
end
