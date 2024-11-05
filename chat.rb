require "dotenv/load"
require "openai"

# Verify if the environment variable is loaded correctly
puts "Loaded API Key: #{ENV['OPENAI_API_KEY']}"

# Initialize OpenAI client
client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

# Prepare an array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Shakespeare."
  },
  {
    "role" => "user",
    "content" => "Hello! What are the best spots for pizza in Chicago?"
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

# Print the response
pp api_response
