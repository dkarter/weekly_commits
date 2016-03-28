require 'thor'
require 'colorize'
require 'active_support/all'

module WeeklyCommits
  class CLI < Thor
    package_name 'Weekly Commits'
    default_task :get_weekly_commits

    desc 'weekly_commits', 'Lists commits for a specified week'
    method_option :week, {
      type: :numeric,
      desc: 'Relative week number. e.g. -w=1 for last week. 0 = current week.',
      aliases: '-w',
      default: 0
    }
    def weekly_commits
      relative_week = options[:week]
      beg_week = relative_week.week.ago.beginning_of_week

      5.times do |day_count|
        date = beg_week + day_count.days
        week_title = date.strftime('%a, %e %b %Y')
        git_date_format = date.strftime('%y-%m-%e')
        puts week_title.yellow
        `git --no-pager log --after='#{git_date_format} 00:00' --before='#{git_date_format} 23:59' --pretty=format:'%s'`
      end
    end
  end
end
