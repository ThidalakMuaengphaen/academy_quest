require 'rails_helper'

RSpec.describe "quest_lists/edit", type: :view do
  let(:quest_list) {
    QuestList.create!(
      title: "MyString",
      completed: false
    )
  }

  before(:each) do
    assign(:quest_list, quest_list)
  end

  it "renders the edit quest_list form" do
    render

    assert_select "form[action=?][method=?]", quest_list_path(quest_list), "post" do

      assert_select "input[name=?]", "quest_list[title]"

      assert_select "input[name=?]", "quest_list[completed]"
    end
  end
end
