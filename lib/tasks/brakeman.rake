desc "Check for security vulnerabilities"
task :brakeman do
  fail unless system("bundle exec brakeman -q --no-pager")
end
