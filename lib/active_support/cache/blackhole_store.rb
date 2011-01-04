module Blackhole
  module Rails2

    def read(key, options = nil)
      log("Read", key, options)
      nil
    end

    def write(key, value, options = nil)
      log("Write", key, options)
      value
    end

    def delete(key, options = nil)
      log("Delete", key, options)
      false
    end

    def delete_matched(matcher, options = nil)
    end

    def exist?(key, options = nil)
      false
    end

  end

  module Rails3
    protected
    def read_entry(key, options)
      nil
    end

    def write_entry(key, entry, options)
      entry
    end
  end

  module Store
    include Rails::VERSION::MAJOR == 3 ? Rails3 : Rails2
  end
end

module ActiveSupport
  module Cache
    class BlackholeStore < Store
      include ::Blackhole::Store
    end

    def initialize(options=nil)
      options ||= {}
      super(options)
    end

    def clear; end
  end
end
