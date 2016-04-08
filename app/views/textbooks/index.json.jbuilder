json.array!(@textbooks) do |textbook|
  json.extract! textbook, :id, :title, :subject, :price, :offer, :created_at, :user_email
  json.url textbook_url(textbook, format: :json)
end
