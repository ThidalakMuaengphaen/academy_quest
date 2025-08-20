require 'rails_helper'

RSpec.describe 'Quest List Management', type: :system do
  before do
    driven_by(:rack_test)
    QuestList.destroy_all
  end

  describe 'quest management' do
    it 'allows creating a new quest' do
      visit root_path

      within('#quest_form') do
        fill_in 'quest_list[title]', with: 'Complete RSpec testing'
        click_button 'Add Quest'
      end

      expect(page).to have_content('Complete RSpec testing')
    end

    it 'allows creating a 2 new quest' do
      visit root_path

      within('#quest_form') do
        fill_in 'quest_list[title]', with: 'Quests'
        click_button 'Add Quest'
      end
      within('#quest_form') do
        fill_in 'quest_list[title]', with: 'Quests2'
        click_button 'Add Quest'
      end

      expect(page).to have_content('Quests')
      expect(page).to have_content('Quests2')
    end


    it 'allows deleting a quest' do
      quest = QuestList.create!(title: 'Test Quest', completed: false)
      visit root_path

      within("#quest_list_#{quest.id}") do
        click_button '🗑️'
      end

      expect(page).not_to have_content('Test Quest')
    end
  end

  describe 'page layout' do
    it 'shows the profile section' do
      visit root_path

      expect(page).to have_content('Thidalak Mueangphaen')
      expect(page).to have_content('(Noeynoey)')
      expect(page).to have_link('✨ Brag Document ✨')
    end

    it 'has the correct form structure' do
      visit root_path

      expect(page).to have_css('.h-40.bg-white.rounded-2xl')
      expect(page).to have_content('➕ Add Quest')
      expect(page).to have_button('Add Quest')
    end
  end
end
