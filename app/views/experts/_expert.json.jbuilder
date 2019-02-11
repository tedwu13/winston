json.extract! expert, :id, :username, :email, :password_digest, :phone_number, :university, :created_at, :updated_at
json.url expert_url(expert, format: :json)
