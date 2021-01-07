class UtilitySerializer
	include FastJsonapi::ObjectSerializer
	def initialize(data)
		require 'pry'; binding.pry
	end
	attributes :name, :is_closed, :image_url, :url, :rating, :review_count, :location, :display_phone, :distance
end