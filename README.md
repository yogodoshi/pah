# Rails Template

A rails application template which born from [Startup DEV][startupdev] and now is used to start most projects at [HE:labs][helabs].

## Usage

1. Clone rails-template to your home directory.
```
git clone git://github.com/Helabs/rails-template.git
```

2. Run rails new app command using this template.
```
rails new app_name -m ~/rails-template/template.rb
```

3. You can pass the database option(i.e: -d mysql or -d postgresql) that it get the correct gem.

### mysql
```
rails new app_name -d mysql -m ~/rails-template/template.rb
```

### postgresql
```
rails new app_name -d postgresql -m ~/rails-template/template.rb
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[startupdev]: http://startupdev.com.br
[helabs]: http://helabs.com.br