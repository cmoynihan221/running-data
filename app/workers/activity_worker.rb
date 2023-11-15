class ActivityWorker
  def load_activities
		activity_files = Dir["activity_json_data/**/*.json"]
		activity_files.each do |file|
			data = read_file_convert_to_hash(file)
			User.find_or_create_by(external_id: data.find!('userId')).tap do |user|
				user.activities.find_or_create_by(external_id: data.find!('id')).tap do |activity|
					summary = SearchableHash.new(data.find!('summary'))
					activity.name = data.find('name')
					activity.total_distance = summary.find('distance')&.to_f
					activity.average_speed = summary.find('averageSpeed')&.to_f
					activity.total_time = summary.find('totalTime')
					activity.start_time = Time.new(summary.find('startTimestamp')) if summary.find('startTimestamp')

				end.save
			end.save

		end
  end

	private 
	
	def read_file_convert_to_hash(file)
		SearchableHash.new(JSON.parse(File.open(file).read))
	end 


end