class BusinessSerializer
	def self.make_json(data)
		{
			# data[:businesses] = [] unless data.key? :businesses
			if data[:businesses] == nil
				data[:businesses] = []
			end
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
end
