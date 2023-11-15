class JsonWebToken
  SECRET_KEY = ENV['PORTAL_WEB_TOKEN_SECRET'] || 'bBvWAfz!Y4UBtJnxib*2P9YW7zear_'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end