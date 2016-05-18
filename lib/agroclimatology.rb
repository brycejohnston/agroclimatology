require "agroclimatology/version"
require "faraday"
require "csv"

module Agroclimatology

  def self.fetch(lat, lon, year_start = 1983, year_end = DateTime.now.year, insolation_surface = true)
    url = "http://power.larc.nasa.gov/cgi-bin/agro.cgi?&step=1"
    url << "&lat=#{lat.to_s}&lon=#{lon.to_s}"
    url << "&ms=1&ds=1&ys=#{year_start.to_s}"
    url << "&me=12&de=31&ye=#{year_end.to_s}"
    url << (insolation_surface ? "&p=swv_dwn&submit=Submit" : "&submit=Submit")

    response = Faraday.get url
    if response.status == 200
      tsv_data = response.body.split("-END HEADER-").last
      CSV.parse(tsv_data, { :col_sep => "\t" }) do |row|
        puts row
      end
    else
      puts "Error: #{response.status}"
    end
  end

end
