json.extract! user, :id, :username, :email, :password_salt, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)