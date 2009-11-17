# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_huazhong_crm_session',
  :secret      => '3f004408c21046739ac7d55904b550ecffed1073aaf8faa3a955b5febb0bb0f8ab748f199a73c8b335db0aece8b743d363773ca0da740d34bb926f6f98ef8e55'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
