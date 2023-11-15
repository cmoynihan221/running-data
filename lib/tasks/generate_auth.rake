
desc "Generate an auth token for API requests"
task generate_auth: :environment do
  puts JsonWebToken.encode(type: :auth)
end