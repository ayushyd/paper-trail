# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end

every :monday, at: '11:00 am' do
  rake "countries_task:countries_list"
end

every :monday, at: '11:00 am' do
	rake "custom_task:list_users"
end

every :day, at: '11:00 am' do 
	rake "email:send_user_email"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
