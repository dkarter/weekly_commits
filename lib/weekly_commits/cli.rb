# frozen_string_literal: true

require 'thor'
require 'colorize'
require 'active_support/all'

module WeeklyCommits
  class CLI < Thor
    package_name 'Weekly Commits'
    default_task :weekly_commits

    desc 'weekly_commits', '[DEFAULT] Lists commits for a specified week'
    method_option :week,
                  type: :numeric,
                  desc: 'Relative week number. e.g. -w=1 for last week. 0 = current week.',
                  aliases: '-w',
                  default: 0

    method_option :show_author,
                  type: :boolean,
                  desc: 'Display author(s) with each commit message. e.g. Did stuff (Ghost Ninja)',
                  default: false

    method_option :sort,
                  type: :string,
                  desc: 'Show commits in ascending/descending order. Default: older commits on top, newer on bottom.',
                  default: 'asc',
                  enum: %w[asc desc]

    method_option :no_merge,
                  type: :boolean,
                  desc: 'Exclude merge commits',
                  default: false

    def weekly_commits
      relative_week = options[:week]
      beg_week = relative_week.week.ago.beginning_of_week

      5.times do |day_count|
        date = beg_week + day_count.days
        week_title = date.strftime('%a, %e %b %Y')
        git_date_format = date.strftime('%Y-%m-%e')
        committer = options[:show_author] ? ' (%cn)'.magenta : ''

        git_log_command = "git --no-pager log --after='#{git_date_format} 00:00' --before='#{git_date_format} 23:59' --pretty=format:'%s#{committer}'"
        git_log_command += ' --no-merges' if options[:no_merge]

        commits = `#{git_log_command}`
        commits = commits.lines.reverse if options[:sort].casecmp('asc').zero?

        puts week_title.yellow
        puts commits
        puts
      end
    end
  end
end
