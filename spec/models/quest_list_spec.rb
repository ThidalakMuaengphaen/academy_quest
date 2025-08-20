require 'rails_helper'

RSpec.describe QuestList, type: :model do
  context "when a user creates a new quest" do
    before do
      QuestList.destroy_all
    end

    it "can create a new quest" do
      quest_list = QuestList.new(title: "test", completed: false)
      expect(quest_list.save).to be true
    end

    it "can be marked as completed" do
      quest_list = QuestList.create(title: "test", completed: true)
      expect(quest_list.completed).to be true
    end
  end
end
