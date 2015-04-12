# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
task(:default).clear

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end

task default: [:spec, :rubocop]

require "rubocop/rake_task"

desc "Run RuboCop"
RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = %w(--display-cop-names)
end
