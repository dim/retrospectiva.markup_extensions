# coding:utf-8 
module WikiEngine
  class MarkupExtension

    class << self
      
      def push(*args, &block)
        WikiEngine.markup_extensions.push new(*args, &block)
      end

    end

    attr_reader :name
    
    def initialize(name, pattern, replacement = nil, &block)
      @name    = name.to_sym
      @pattern = pattern
      @replacement = block_given? ? block : replacement
    end

    def apply_to!(content)
      if @replacement.is_a?(Proc)
        content.gsub!(@pattern, &@replacement)
      else
        content.gsub!(@pattern, @replacement)
      end
    end

  end
end
