require 'net/http'
require 'uri'


def thread i
Thread.new do
	uri = URI(ARGV[1])
	http = Net::HTTP.new(uri.host, uri.port)
	path = uri.path.empty? ? "/" : uri.path
	query = uri.query.nil? ?  "" : "?" + uri.query	
	res = http.get(path + query, nil)

	puts res.code + " " + i.to_s
	if (res.code != '200') 
		puts res.body
	end
	end	
end


i = 0
while i<ARGV[0].to_i
 thread i

i+=1
end


sleep
