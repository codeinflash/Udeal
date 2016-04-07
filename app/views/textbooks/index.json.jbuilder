json.array!(@textbooks) do |textbook|
  json.extract! textbook, :id, :title, :subject, :price, :offer, :created_at
  json.url textbook_url(textbook, format: :json)
end
