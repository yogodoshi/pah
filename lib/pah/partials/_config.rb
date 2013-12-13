@config = {}

# heroku questions
@config[:heroku] = Hash.new
if (@config[:heroku][:create?] = will_you_like_to? "create Heroku apps?".red)
  @config[:heroku][:deploy?] = will_you_like_to? "deploy immediately?".red
end
