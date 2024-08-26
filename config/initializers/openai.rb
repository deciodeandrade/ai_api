OpenAI.configure do |config|
  config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN")
  #config.organization_id = ENV.fetch("OPENAI_ORGANIZATION_ID", nil) # Pode ser opcional
  config.log_errors = true # Recomendado para desenvolvimento
end
