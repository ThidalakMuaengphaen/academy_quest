require 'rails_helper'

RSpec.describe "quest_lists/index", type: :view do
  before(:each) do
    assign(:quest_lists, [
      QuestList.create!(
        title: "Title",
        completed: false
      ),
      QuestList.create!(
        title: "Title",
        completed: false
      )
    ])
  end

  it "renders a list of quest_lists" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
