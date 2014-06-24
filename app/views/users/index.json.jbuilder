json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :background, :accomplishments, :professional_summary, :personal_statement, :role, :admin
  json.url user_url(user, format: :json)
end
