require "rake-n-bake"

require "standard/rake"
task standard: :standard_announce
task(:standard_announce) { RakeNBake::Baker.log_step("Running Standard Ruby") }

require "slim_lint/rake_task"
SlimLint::RakeTask.new
task slim_lint: :slim_lint_announce
task(:slim_lint_announce) { RakeNBake::Baker.log_step("Running Slim Lint") }

require "semantic_release/rake_task"
SemanticRelease::RakeTask.new

task default: %w[
  standard
  slim_lint
  bake:rspec
  bake:brakeman
  bake:rails_best_practices
  bake:bundle-audit
  bake:ok_rainbow
]
