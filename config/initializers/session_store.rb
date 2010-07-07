# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_loja_session',
  :secret      => '4390947bc12cc90e97d0c1e54f759bf97190c35c46ce77dac582b3e96f7a7a025515170d67e3d467030569d931dae4688407770e07bff404c26e6e8fc1331e5f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
