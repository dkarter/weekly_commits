require 'thor'
require 'colorize'
require 'active_support/all'

module WeeklyCommits
  class CLI < Thor
    package_name 'Weekly Commits'
    default_task :weekly_commits

    desc 'weekly_commits', '[DEFAULT] Lists commits for a specified week'
    method_option :week, {
      type: :numeric,
      desc: 'Relative week number. e.g. -w=1 for last week. 0 = current week.',
      aliases: '-w',
      default: 0,
    }

    method_option :show_committer, {
      type: :boolean,
      desc: 'Display committer with each commit message. e.g. Did stuff (Dorian Karter)',
      default: false,
    }

    method_option :sort, {
      type: :string,
      desc: 'Show commits in ascending/descending order. Default: older commits on top, newer on bottom.',
      default: 'asc',
      enum: ['asc','desc'],
    }

    def weekly_commits
      relative_week = options[:week]
      beg_week = relative_week.week.ago.beginning_of_week

      5.times do |day_count|
        date = beg_week + day_count.days
        week_title = date.strftime('%a, %e %b %Y')
        git_date_format = date.strftime('%Y-%m-%e')
        committer = options[:show_committer] ? ' (%cn)' : ''

        commits = `git --no-pager log --after='#{git_date_format} 00:00' --before='#{git_date_format} 23:59' --pretty=format:'%s#{committer}'`

        commits = commits.lines.reverse if options[:sort].downcase == 'asc'

        puts week_title.yellow
        puts commits
        puts
      end
    end
  end
end
