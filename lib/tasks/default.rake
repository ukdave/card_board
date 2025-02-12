Rake::Task[:default].prereqs.clear if Rake::Task.task_defined?(:default)

task default: %w[
  standard
  slim_lint
  spec
  brakeman
  rails_best_practices
  bundle:audit:update
  bundle:audit:check
  rake_announcer:ok
]
