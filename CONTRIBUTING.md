# Contributing

We love pull requests. Here's a quick guide:

1. Fork the repo.

1. Create your feature branch (`git checkout -b my-new-feature`)

1. Update [CHANGELOG.md](https://github.com/Helabs/pah/blob/master/CHANGELOG.md) with a brief description of your changes under the `unreleased` heading.

1. Commit your changes (`git commit -am 'Added some feature'`)

1. Push to the branch (`git push origin my-new-feature`)

1. Create new Pull Request

## Removing gems

Pah is an opinionated Rails template. All gems are our recommendations to recurring problems based on our experience. For example, when writing tests that need to access network we recommend using VCR and WebMock.
If you want to make a PR to add/remove gem X, please follow the steps below:

1. Make a PR to our blog and explain the gem's pros and cons, how to use, the tricks etc.
1. Make a PR to remove gem X

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within three business days (and, typically, one business
day). We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted is to follow the practices described on [Ruby style guide](https://github.com/bbatsov/ruby-style-guide), [Rails style guide](https://github.com/bbatsov/rails-style-guide) and [Better Specs](http://betterspecs.org/).

