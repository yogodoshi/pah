copy_static_file 'app/views/layouts/application.html.slim'
copy_static_file 'app/views/application/_error_messages.html.slim'
copy_static_file 'app/views/application/_flash_messages.html.slim'

gsub_file 'app/views/layouts/application.html.slim', /= page_title(app_name: 'example')/, "= page_title(app_name: '#{@app_name}')"

git add: 'app/views/'
git_commit 'Add layout files.'