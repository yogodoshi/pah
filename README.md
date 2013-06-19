# Pah

A rails application template which born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

## Instalation

Only install the Pah gem:

    gem install pah

## Usage

Run:

    pah projectname

This will create a Rails 3.2 app in `projectname`. This script creates a new git repository. It is not meant to be used against an existing repo.

Be sure to set your canonical domain on Heroku:
```shell
heroku config:add CANONICAL_HOST=yourdomain.com #or www.yourdomain.com
```

## Dependencies

### heroku toolbelt

So Install this from https://toolbelt.heroku.com/

### phantomjs

On OSX install with:

```shell
brew install phantomjs
```

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
