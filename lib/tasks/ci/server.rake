namespace :ci do
  # Stub ci:all rake task
  task :all

  desc 'publish'
  task publish: [
    'ci:slack:publish',
    'ci:prometheus:publish'
  ]

  desc 'Runs the Rake CI server'
  task :server do
    require 'ndr_dev_support/daemon/ci_server'

    worker = NdrDevSupport::Daemon::CIServer.from_args(ENV)
    worker.run
  end
end
