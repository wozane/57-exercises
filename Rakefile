require 'rake/testtask'

desc 'Run tests'
Rake::TestTask.new do |t|
  t.libs = ''
  t.pattern = '*/*test.rb'
  t.verbose = true
end

task default: [:test]
