require 'active_support/concern'

module Hook
  # Hook action
  module Hooker
    extend ActiveSupport::Concern

    class_methods do
      def method_added(name)
        # only target method
        return if name.to_s != 'test'
        return if /hook/.match(name.to_s) || method_defined?("#{name}_renamed")


        # rename
        origin_method = "#{name}_renamed".to_sym
        alias_method(origin_method, name)

        define_method(name) do |*args, &block|
          begin
            start_time = Time.now
            p "hook method start: #{start_time}"
            send(origin_method, *args, &block)
          rescue => e
            p e.message
          ensure
            end_time = Time.now
            p "hook method end: #{end_time}"
          end
        end
      end
    end
  end
end