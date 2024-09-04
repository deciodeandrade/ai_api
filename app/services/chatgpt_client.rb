class ChatgptClient
  include HTTParty
  attr_reader :api_url, :options, :model, :message
  
  def initialize(message, model = 'gpt-4o-mini')
    api_key = ENV.fetch("OPENAI_ACCESS_TOKEN")
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/chat/completions'
    @model = model
    @message = message
  end
  
  def call
    body = {
      model:,
      messages: [{ role: 'user', content: message }]
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 10)
    raise response['error']['message'] unless response.code == 200
    response['choices'][0]['message']['content']
  end
  
  class << self
    def call(message, model = 'gpt-4o-mini')
      new(message, model).call
    end
  end
end
