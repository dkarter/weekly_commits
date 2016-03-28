# WeeklyCommits

WeeklyCommits is a command line tool for getting a bird's eye view of your
commits on a branch for a specific week.

It is particularly helpful for stand ups, filling up detailed time sheets and
for recap when starting up again after a long weekend.

## Installation

```ruby
gem 'weekly_commits'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weekly_commits

## Usage

For help type:

```sh
wcomm help
# or
wcomm help weekly_commits
```

Usage documentation from command-line:

```
Usage:
  wcomm

Options:
  -w, [--week=N]                                 # Relative week number. e.g. -w=1 for last week. 0 = current week.
                                                 # Default: 0
      [--show-author], [--no-show-author]        # Display author(s) with each commit message. e.g. Did stuff (Dorian Karter)
      [--sort=SORT]                              # Show commits in ascending/descending order. Default: older commits on top, newer on bottom.
                                                 # Default: desc
                                                 # Possible values: asc, desc
```

### Example

First navigate to a repo and make sure you have the WeeklyCommits gem installed
for that version of ruby in that directory.

Show me this week's commits:

```sh
wcomm
```

Show me last weeks commits:

```sh
wcomm -w=1
```

Show me commits from two weeks ago including committer

```sh
wcomm -w=2 --show-author
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## TODO

- [ ] Add support for multiple branches

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/dkarter/weekly_commits.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

