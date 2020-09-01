require 'spec_helper'

describe WeeklyCommits do
  it 'has a version number' do
    expect(WeeklyCommits::VERSION).not_to be nil
  end

  context 'default options' do
    let(:default_args) { [] }
    let(:default_options) do
      { week: 0, sort: 'asc' }
    end

    it 'lists commits for Monday through Friday' do
      days_printed = 5
      expect(WeeklyCommits::CLI.new(default_args, default_options).weekly_commits).to eq(days_printed)
    end
  end
end
