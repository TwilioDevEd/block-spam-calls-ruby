# Rakefile
require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "block_spam_calls/*_test.rb"
  t.warning = false
end

task default: :test
