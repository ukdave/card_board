require "rake-n-bake"
require "standard/rake"
require "slim_lint/rake_task"

task standard: :standard_announce
task(:standard_announce) { RakeNBake::Baker.log_step("Running Standard Ruby") }

SlimLint::RakeTask.new
task slim_lint: :slim_lint_announce
task(:slim_lint_announce) { RakeNBake::Baker.log_step("Running Slim Lint") }

task default: %w[
  standard
  slim_lint
  bake:brakeman
  bake:rails_best_practices
  bake:bundle-audit
  bake:ok_rainbow
]
