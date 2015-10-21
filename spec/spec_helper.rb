require 'active_record'
require 'rspec'
require 'shoulda-matchers'
require 'family_tree_TDD'


database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Task.all.each {|task| task.destroy}
    List.all.each {|list| list.destroy}
  end
end
