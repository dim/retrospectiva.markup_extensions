module FormatHelper

  protected
  
    def post_markup_with_markup_extensions(content)
      returning post_markup_without_markup_extensions(content) do |output|
        WikiEngine.markup_extensions.each do |extension|
          next unless RetroCM[:content][:markup_extensions][extension.name]
          extension.apply_to!(output)
        end
      end
    end
    alias_method_chain :post_markup, :markup_extensions

end
