# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "/cron_log.log"
#
# every 1.minute do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 1.minute do
  rake "batch:delete_old_deny_tokens"
end

# Learn more: http://github.com/javan/whenever
