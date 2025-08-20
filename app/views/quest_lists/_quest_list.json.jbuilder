json.extract! quest_list, :id, :title, :completed, :created_at, :updated_at
json.url quest_list_url(quest_list, format: :json)
