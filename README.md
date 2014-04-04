# Pah
[![RubyGems][gem_version_badge]][ruby_gems]
[![Code Climate][code_climate_badge]][code_climate]
[![Gemnasium][gemnasium_badge]][gemnasium]

A rails application template which was born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

Pah is an opinionated Rails template. All gems are our recommendations to recurring problems based on our experience. For example, when writing tests that need to access network we recommend using VCR and WebMock.
If you want to make a PR to add/remove gem X, please follow below steps:

1. Make a PR to remove gem X
2. Make a PR to our blog and explain the gem's pros and cons, how to use, the tricks etc.

## Instalation

Install Pah at the command prompt:

    gem install pah

If you're using [RVM see those tips](https://github.com/Helabs/pah/wiki/Using-Pah-with-RVM).

## Usage

Run:

    pah projectname

This will create a Rails 4.0 app in `projectname` with ruby 2.1.1. This script creates a new git repository. It is not meant to be used against an existing repo.

### RVM

If using the rvm is recomended before using pah, create and use a gemset, with the project name.

```bash
$ rvm use 2.1.1@projectname --create
```

Pah automatically create the .ruby-version and .ruby-gemset files.

## Dependencies

### heroku toolbelt

Install from: https://toolbelt.heroku.com/

### phantomjs

Install from: http://phantomjs.org/download.html

## Versioning

Pah follow the [Semantic Versioning](http://semver.org/).

## Issues

If you have problems, please create a [Github Issue](https://github.com/Helabs/pah/issues).

## Contributing

Please see [CONTRIBUTING.md](https://github.com/Helabs/pah/blob/master/CONTRIBUTING.md) for details.

## Maintainers

- [Mauro George](https://github.com/maurogeorge)

## Roadmap

- Release 1.0.0 only when we have tests. I know this is a shame, but until then we can't release this version.

## Release

Follow this steps to release a new version of the gem.

1. Test if everything is running ok;
1. Change version of the gem on `VERSION` constant;
1. Add the release date on the `CHANGELOG`;
1. Do a commit "Bump version x.x.x", follow the semantic version;
1. Run `$ rake release`, this will send the gem to the rubygems;
1. Check if the gem is on the rubygems and the tags are correct on the github;

## Credits

Pah is maintained and funded by [HE:labs](http://helabs.com.br/opensource/).
Thank you to all the [contributors](https://github.com/Helabs/pah/graphs/contributors).

[startupdev]: http://startupdev.com.br
[helabs]: http://helabs.com.br
[gem_version_badge]: https://badge.fury.io/rb/pah.png
[ruby_gems]: http://rubygems.org/gems/pah
[code_climate]: https://codeclimate.com/github/Helabs/pah
[code_climate_badge]: https://codeclimate.com/github/Helabs/pah.png
[gemnasium]: https://gemnasium.com/Helabs/pah
[gemnasium_badge]: https://gemnasium.com/Helabs/pah.png

