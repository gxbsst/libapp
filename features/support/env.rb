require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do


end



#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { :except => [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

