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
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# 出力先logの指定
set :output, 'log/crontab.log'
# 実行環境の指定
set :environment, :production
# set :environment, :development

# 1時間毎に実行
every 1.hour do
  rake 'sync:feeds'
end

# # 5分毎に実行
# every 5.minutes do
#   rake 'sync:feeds'
# end