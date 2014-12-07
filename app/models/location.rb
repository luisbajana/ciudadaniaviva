class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :description, :directory_id, :gmaps, :user_id

  belongs_to :directory

  geocoded_by :address

  after_validation :geocode

  acts_as_gmappable

  def gmaps4rails_address
      address
  end

  def self.import(file,directory_id)

		  spreadsheet = open_spreadsheet(file)

		  header = spreadsheet.row(1)

		  header.map! { |element|
			   if( element =~ /irecci(.*)/ || element =~ /bicaci(.*)/ )
			       "address"

			   elsif ( element =~ /ombre(.*)/ || element =~ /escrip(.*)/ || element =~ /eferencia(.*)/ )
			       "description"	    
			   else
			       element
			   end
			}
			puts header

		  (2..spreadsheet.last_row).each do |i|
		    row = Hash[[header, spreadsheet.row(i)].transpose]

		    if row

		    	if row["address"]
			    	row["address"] = row["address"]+", Santiago, Chile"
			    	row["directory_id"] = directory_id
			    	
			    	location = find_by_id(row["id"]) || new
			    	location.attributes = row.to_hash.slice(*accessible_attributes)
			    	location.save!
			    end
			end
			
	  	  end
	end



	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Roo::Csv.new(file.path, nil, :ignore)	
		when ".xls" then Roo::Excel.new(file.path, nil, :ignore)	
		when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end	

  
end
