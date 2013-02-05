# Rails Template

A rails application template which born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

## Usage

1. Install heroku toolbelt.

```
https://toolbelt.heroku.com/
```

2. Clone rails-template to your home directory.
```
git clone git://github.com/Helabs/rails-template.git
```

3. Run rails new app command using this template.
```
rails new app_name -m ~/rails-template/template.rb
```

4. Be sure to set your canonical domain on Heroku:
```
heroku config:add CANONICAL_HOST=yourdomain.com #or www.yourdomain.com
```

5. That's it! Everything should be in place.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Development cycle

1. Make modifications
2. Run build
```
./build
```
4. It should open your browser on heroku app with message "Profit!"
5. Profit!

## Shameless advertising

[startupdev]: http://startupdev.com.br
[helabs]: http://helabs.com.br
