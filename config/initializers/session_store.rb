# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_accounting_session',
  :secret      => '3aecdf3e444ef96b3059fa0a87c2acfb5635048142781109be02f93a64bd09405211273411aee24bd1e70f9375ef8f5baad0c3bebd1329808f0337c8ef1e0a2a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
