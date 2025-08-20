require "rails_helper"

RSpec.describe QuestListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/quest_lists").to route_to("quest_lists#index")
    end

    it "routes to #new" do
      expect(get: "/quest_lists/new").to route_to("quest_lists#new")
    end

    it "routes to #show" do
      expect(get: "/quest_lists/1").to route_to("quest_lists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/quest_lists/1/edit").to route_to("quest_lists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/quest_lists").to route_to("quest_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/quest_lists/1").to route_to("quest_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/quest_lists/1").to route_to("quest_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/quest_lists/1").to route_to("quest_lists#destroy", id: "1")
    end
  end
end
