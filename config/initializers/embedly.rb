require 'figaro'
def initialize_embedly
	Embedly::API.new({:key => Figaro.env.embedly_api_key})
end

$embedly_api = initialize_embedly