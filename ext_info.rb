#--
# Copyright (C) 2009 Dimitrij Denissenko
# Please read LICENSE document for more information.
#++
require 'wiki_engine/markup_extension'

module WikiEngine
  mattr_accessor :markup_extensions
  self.markup_extensions = []
end

WikiEngine::MarkupExtension.push 'slideshare', /\[slideshare (.+?)\]/ do |match|
  match =~ /\[slideshare (.+?)\]/
  %Q(<object><embed src="http://static.slidesharecdn.com/swf/ssplayer2.swf?#{$1}" type="application/x-shockwave-flash" width="425" height="350" allowscriptaccess="always" allowfullscreen="true"></embed></object>)  
end
