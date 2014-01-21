Class ContactDatabase

	def initialize(path)
		
	end

	def read_file
		CSV.foreach("./contact_database.csv") do |row|
			puts row
		end
	end

	def write_file
		CSV.open("./contact_database.csv") do |csv|
			csv << "Hello"
		end
	end

end