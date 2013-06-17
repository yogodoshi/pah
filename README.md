# Pah

A rails application template which born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

## Instalation

First install the pah gem:

    gem install pah

Then run:

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

## Issues

If you have problems, please create a [Github Issue](https://github.com/Helabs/rails-template/issues).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[startupdev]: http://startupdev.com.br
[helabs]: http://helabs.com.br
