<<<<<<< HEAD
server "52.69.21.96", user: "user_name", roles: %w{web app}
set  :ssh_options, keys: '/Users/kudoeimii/.ssh/id_rsa'
=======
server "52.69.21.96", user: "app", roles: %w{web app}
set :ssh_options, keys: '/Users/kudoeimii/.ssh/id_rsa'
>>>>>>> origin/master