Bugsnag.configure do |config|
  config.release_stage = ENV.fetch("BUGSNAG_RELEASE_STAGE") { Rails.env }
  config.notify_release_stages = ["production", "staging"]
  config.api_key = ENV.fetch("BUGSNAG_API_KEY")
  config.auto_capture_sessions = Rails.env.production?
end
