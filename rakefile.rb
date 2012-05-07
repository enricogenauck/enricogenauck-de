require 'rubygems'
require 'rake'
require File.dirname(__FILE__) + '/application.rb'

desc "Cleans the redis cache"
task "cron" do
  puts "Flushing redis cache: " + REDIS.flushdb
end