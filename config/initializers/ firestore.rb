# config/initializers/firebase.rb

require 'google/cloud/firestore'

firebase_config_file = Rails.root.join('config/firebase.yml')
firebase_config = YAML.load_file(firebase_config_file)[Rails.env].symbolize_keys

FIRESTORE = Google::Cloud::Firestore.new(project_id: firebase_config[:project_id])
