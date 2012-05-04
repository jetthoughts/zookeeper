# Ruby wrapper for the Zookeeper C API

require 'thread'
require 'monitor'
require 'forwardable'
require 'logger'

require 'backports'

module Zookeeper
  # establishes the namespace
end

require_relative 'zookeeper/acls'
require_relative 'zookeeper/constants'
require_relative 'zookeeper/exceptions'
require_relative 'zookeeper/common'
require_relative 'zookeeper/callbacks'
require_relative 'zookeeper/stat'
require_relative 'zookeeper/client_methods'

# ok, now we construct the client

require_relative 'zookeeper/client'

module Zookeeper
  include Constants

  unless defined?(@@logger)
    @@logger = Logger.new($stderr).tap { |l| l.level = Logger::ERROR } 
  end

  def self.logger
    @@logger
  end

  def self.logger=(logger)
    @@logger = logger
  end

  # @private
  def self.deprecation_warnings?
    @deprecation_warnings = true if @deprecation_warnings.nil?
  end

  # set this to false to mute Zookeeper related deprecation warnings...
  # __AT YOUR PERIL__
  def self.deprecation_warnings=(v)
    @deprecation_warnings = v
  end

  # @private
  def self.deprecation_warning(warning)
    Kernel.warn(warning) if deprecation_warnings?
  end
end

# just for first test, get rid of this soon
require 'zookeeper/compatibility'

