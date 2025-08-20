require 'rails_helper'

RSpec.describe 'QuestLists', type: :request do
  describe 'GET /quest_lists' do
    it 'renders the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /quest_lists" do
    context "with valid params" do
      let(:valid_params) { { quest_list: { title: "New Quest", completed: false } } }

      it "creates a new quest and responds with turbo_stream" do
        expect {
          post quest_lists_path, params: valid_params, as: :turbo_stream
        }.to change(QuestList, :count).by(1)

        expect(response.media_type).to eq("text/vnd.turbo-stream.html")
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH /quest_lists/:id' do
    it 'updates the quest title' do
      quest = QuestList.create!(title: 'Old Title')
      patch quest_list_path(quest), params: { quest_list: { title: 'New Title' } }
      quest.reload
      expect(quest.title).to eq('New Title')
    end
  end

  describe 'with Turbo Stream requests' do
    it 'DELETE /quest_lists/:id responds with turbo_stream' do
      quest = QuestList.create!(title: 'Delete Turbo')
      delete quest_list_path(quest), headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      expect(response.content_type).to include('text/vnd.turbo-stream.html')
    end

    it 'PATCH /quest_lists/:id responds with turbo_stream' do
      quest = QuestList.create!(title: 'Update Turbo')
      patch quest_list_path(quest),
            params: { quest_list: { title: 'Updated Turbo' } },
            headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      expect(response.content_type).to include('text/vnd.turbo-stream.html')
    end
  end

  describe 'error handling' do
    it 'handles missing quest gracefully on DELETE' do
      expect do
        delete quest_list_path(id: 999_999)
      end.not_to raise_error
    end
  end
end