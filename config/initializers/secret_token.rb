# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SampleApp::Application.config.secret_key_base = '021d3b73efd70864f46dadf135c1a60ecf11526da4bc783f8da6bce793761b81ea43a2cd2686a69fa3f68545802b53fcdc4bbfa72c169eac8e5b9302bd8d3c66'

require 'securerandom'

def secure_token
	token_file = Rail.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end