# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ticketsystem_session',
  :secret      => '1dffee79272bd433928dbf16be3d8cda4592785da646ce46374f407b2512a30bcec7353311411a96d9d08d69e01972eeceb823a7e7d4a14fd5336c0488f47c57'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
