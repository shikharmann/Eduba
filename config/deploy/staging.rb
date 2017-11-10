# server '35.154.214.21', user: 'ec2-user', roles: %w(app)
# server '35.154.214.21', user: 'ec2-user', roles: %w(web)
# server '35.154.214.21', user: 'ec2-user', roles: %w(db)
# set :application, 'GamedayBudweiser'
# set :rails_env, 'production'
# set :deploy_to, '/home/ec2-user/apps/GamedayBudweiser/'
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
# set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# set :sidekiq_role,          -> { :db }
# set :whenever_roles,        -> { :db }
# set :whenever_command,      -> { [:bundle, :exec, :whenever] }
# set :whenever_command_environment_variables, -> { { rails_env: fetch(:whenever_environment) } }
# set :whenever_identifier,   -> { fetch :application }
# set :whenever_environment,  -> { fetch :rails_env, fetch(:stage, 'production') }
# set :whenever_variables,    -> { "environment=#{fetch :whenever_environment}" }
# set :whenever_update_flags, -> { "--update-crontab #{fetch :whenever_identifier} --set #{fetch :whenever_variables}" }
# set :whenever_clear_flags,  -> { "--clear-crontab #{fetch :whenever_identifier}" }

# # puma config
# set :puma_workers, 3
# set :puma_threads, [1, 5]
# set :puma_conf, -> { "#{shared_path}/config/puma.rb" }
# set :puma_state, "#{shared_path}/tmp/pids/puma.state"
# set :puma_init_active_record, true

# set :ssh_options, {
#   forward_agent: true
# }
