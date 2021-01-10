class BusinessSerializer
	# include FastJsonapi::ObjectSerializer
	# attributes :name, :is_closed, :image_url, :url, :rating, :review_count, :location, :display_phone, :distance
	def self.make_json(data)
		{
			'data': data[:businesses].map do |biz|
				{
					'id': biz[:id],
					'name': biz[:name],
					'image': biz[:image_url],
					'is_closed': biz[:is_closed],
					'url': biz[:url],
					'review_count': biz[:review_count],
					'rating': biz[:rating],
					'categories': biz[:categories].map do |cat|
						cat[:title]
					end,
					'location': {
						'address1': biz[:location][:address1],
    				'address2': biz[:location][:address2],
    				'address3': biz[:location][:address3],
    				'city': biz[:location][:city],
    				'zip_code': biz[:location][:zip_code],
    				'country': biz[:location][:country],
    				'state': biz[:location][:state],
					},
					'phone': biz[:display_phone],
					'distance': biz[:distance]
				}
			end
		}
	end

	def self.make_show_json(data)
		{
			'id': data[:id],
			'name': data[:name],
			'image': data[:image_url],
			'is_closed': data[:is_closed],
			'url': data[:url],
			'review_count': data[:review_count],
			'rating': data[:rating],
			'categories': data[:categories].map do |cat|
				cat[:title]
			end,
			'location': {
				'address1': data[:location][:address1],
				'address2': data[:location][:address2],
				'address3': data[:location][:address3],
				'city': data[:location][:city],
				'zip_code': data[:location][:zip_code],
				'country': data[:location][:country],
				'state': data[:location][:state],
			},
			'phone': data[:display_phone],
			'distance': data[:distance]
		}
	end
end
