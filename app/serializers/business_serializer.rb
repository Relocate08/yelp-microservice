class BusinessSerializer
	def self.make_json(data)
		if data[:businesses] == nil
			data[:businesses] = []
		end
		{
			'data': data[:businesses].map do |biz|
				biz[:categories] = [] if biz[:categories] == nil
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
		data[:categories] = [] if data[:categories] == nil
		data[:categories][:location] = [] if data[:location] == nil
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

	def self.make_event_json(data)
		data[:events] = [] if data[:events] == nil
		{
			'events': data[:events].map do |event|
				{
					'id': event[:id],
					'name': event[:name],
					'is_free': event[:is_free],
					'is_canceled': event[:is_canceled],
					'url': event[:event_site_url],
					'attending_count': event[:attending_count],
					'interested_count': event[:interested_count],
					'location': event[:location][:display_address],
					'time_start': event[:time_start]
				}
			end
		}
	end
end
