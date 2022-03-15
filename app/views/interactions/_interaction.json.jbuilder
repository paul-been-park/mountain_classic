json.extract! interaction, :id, :tick, :summited, :user_id, :climb_id,
              :created_at, :updated_at
json.url interaction_url(interaction, format: :json)
