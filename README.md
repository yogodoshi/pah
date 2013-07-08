# Pah
[![RubyGems][gem_version_badge]][ruby_gems]
[![Code Climate][code_climate_badge]][code_climate]
[![Gemnasium][gemnasium_badge]][gemnasium]

A rails application template which was born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

## Instalation

Add it to your Gemfile:

    gem install pah

## Usage

Run:

    pah projectname

This will create a Rails 3.2 app in `projectname` with ruby 1.9.3. This script creates a new git repository. It is not meant to be used against an existing repo.

Be sure to set your canonical domain on Heroku:
```shell
heroku config:add CANONICAL_HOST=yourdomain.com #or www.yourdomain.com
```

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

