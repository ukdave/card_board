desc "Chcek code quality"
task :rails_best_practices do
  fail unless system("bundle exec rails_best_practices")
end
