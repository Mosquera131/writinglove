json.extract! post, :id, :category, :title, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
