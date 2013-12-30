require "bootstrap-sass-rails"
require "bootstrap-wysihtml5-rails"
require "inherited_resources"
require "jquery-rails"
require "simple_form"
require "will_paginate"
require "will_paginate-bootstrap"

require "brightcontent/rails/routes"
require "brightcontent/engine"

module Brightcontent
  autoload :Pagination, 'brightcontent/pagination'
  autoload :PageMethods, 'brightcontent/page_methods'
  autoload :RoutesParser, 'brightcontent/routes_parser'
  autoload :DefaultActions, 'brightcontent/default_actions'
  autoload :StrongParamsFix, 'brightcontent/strong_params_fix'
  autoload :ModelExtensions, 'brightcontent/model_extensions'

  mattr_reader :extensions
  @@extensions = %w{core}

  mattr_accessor :engine_resources
  @@engine_resources = %w{sessions admin_users}

  mattr_accessor :path
  @@path = "admin"

  mattr_accessor :application_name
  @@application_name = "Brightcontent"

  mattr_accessor :locale

  def self.setup
    yield self
  end

  def self.register_extension(name)
    @@extensions << name
  end
end
