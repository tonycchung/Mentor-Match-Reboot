# uri = URI.parse(ENV["REDISTOGO_URL"])
# REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])
REDIS = Redis.new(:host => 'localhost', :port => 6379)
