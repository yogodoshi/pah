Jumpup::Heroku.configure do |config|
  config.app = 'PROJECT'
end if Rails.env.development?