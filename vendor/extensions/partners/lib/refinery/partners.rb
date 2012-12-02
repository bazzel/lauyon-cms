require 'refinerycms-core'

module Refinery
  autoload :PartnersGenerator, 'generators/refinery/partners_generator'

  module Partners
    require 'refinery/partners/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
