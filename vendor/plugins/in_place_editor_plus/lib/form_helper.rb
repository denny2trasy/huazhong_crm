module ActionView
  module Helpers
    class InstanceTag
      def to_content_tag(tag_name, options = {})
        
        if value(object).nil?
          content = nil
        elsif value(object)==false
         content = 'false'
       else
          content = value(object).to_s
        end
        content = options[:text] || content 
        
        content_tag(tag_name, content , options)
      end
    end
  end
end