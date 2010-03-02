module ActiveSupport
  module Cache
    class BlackholeStore < Store
    
      def initialize
        super

        @data = {}
      end
      
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
      
      def clear
      end

      def keys
        @data.keys
      end
      
    end    
  end
end
