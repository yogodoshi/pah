in_root do
  run "rake db:create db:migrate db:test:clone"
end
