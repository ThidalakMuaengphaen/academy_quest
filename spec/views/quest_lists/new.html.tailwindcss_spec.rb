require 'rails_helper'

RSpec.describe "quest_lists/new", type: :view do
  before(:each) do
    assign(:quest_list, QuestList.new(
      title: "MyString",
      completed: false
    ))
  end

  it "renders new quest_list form" do
    render

    assert_select "form[action=?][method=?]", quest_lists_path, "post" do
      assert_select "input[name=?]", "quest_list[title]"

      assert_select "input[name=?]", "quest_list[completed]"
    end
  end
end
