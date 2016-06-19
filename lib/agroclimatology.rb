require "agroclimatology/version"
require "httparty"
require "oj"

module Agroclimatology

  def self.fetch(lat, lon, year_start = 1983, year_end = DateTime.now.year)
    url = "http://power.larc.nasa.gov/cgi-bin/agro.cgi?&step=1"
    url << "&lat=#{lat.to_s}&lon=#{lon.to_s}"
    url << "&ms=1&ds=1&ys=#{year_start.to_s}"
    url << "&me=12&de=31&ye=#{year_end.to_s}"
    url << "&p=toa_dwn&p=swv_dwn&p=lwv_dwn&submit=Submit"

    response = HTTParty.get(url)
    if response.code == 200
      page_data = response.body.split("-END HEADER-").last
      data = []
      page_data.split("\n").each do |line|
        row = line.split(" ")
        unless row[0].to_s.empty?
          daily_record = {
            "year": row[0],
            "day_of_year": row[1],
            "rad_atmosphere": row[2],
            "rad_surface": row[3],
            "rad_flux": row[4]
          }
          data << daily_record
        end
      end
      return data
    else
      puts "Error: #{response.status}"
    end
  end

end
