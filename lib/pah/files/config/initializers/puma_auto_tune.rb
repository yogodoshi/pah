PumaAutoTune.config do |config|
  config.ram = Integer(ENV['PUMA_RAM']) if ENV['PUMA_RAM'] # default to 512mb
  config.frequency = Integer(ENV['PUMA_FREQUENCY']) if ENV['PUMA_FREQUENCY'] # default to 10 seconds
  config.reap_duration = Integer(ENV['PUMA_REAP_DURATION']) if ENV['PUMA_REAP_DURATION'] #default to 90 seconds
end
PumaAutoTune.start