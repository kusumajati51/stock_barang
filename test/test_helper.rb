ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)
  require 'test_helper'

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures

  # Add more helper methods to be used by all tests h           ere...
end
