require 'rake/testtask'

desc 'Run tests'
Rake::TestTask.new do |t|
  t.libs = ''
  t.pattern = '*/*_test.rb'
  t.verbose = false
  t.warning = false
end

task default: [:test]
