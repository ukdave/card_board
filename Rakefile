# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

require "rake_announcer/rake_task"
RakeAnnouncer::RakeTask.new(tasks: Rake::Task[:default].prereqs, prepend: true)
