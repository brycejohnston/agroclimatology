require "agroclimatology/version"
require "csv"
require "faraday"
require "oj"

module Agroclimatology

  def self.fetch(lat, lon, year_start = 1983, year_end = DateTime.now.year)
    url = "http://power.larc.nasa.gov/cgi-bin/agro.cgi?&step=1"
    url << "&lat=#{lat.to_s}&lon=#{lon.to_s}"
    url << "&ms=1&ds=1&ys=#{year_start.to_s}"
    url << "&me=12&de=31&ye=#{year_end.to_s}"
    url << "&p=swv_dwn&submit=Submit"

    response = Faraday.get url
    if response.status == 200
      page_data = response.body.split("-END HEADER-").last
      data = []
      page_data.split("\n").each do |line|
        row = line.split(" ")
        unless row[0].to_s.empty?
          daily_record = {
            "year": row[0],
            "day_of_year": row[1],
            "insolation_surface": row[2]
          }
          data << daily_record
        end
      end
      json = Oj.dump(data)
      puts json
    else
      puts "Error: #{response.status}"
    end
  end

end
