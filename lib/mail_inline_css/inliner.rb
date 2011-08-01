require 'nokogiri'
require 'css_parser_master'

module MailInlineCss
  class Inliner
    attr_reader :mail
    def inline_css!(mail)
      @mail = mail
      if (mail.main_type == 'text' && mail.sub_type == 'html')
        inline_css(mail)
      else
        mail.all_parts.select { |p| p.mime_type == 'text/html' && !p.attachment? }.each do |part|
          inline_css(part)
        end
      end
    end
    
    private
    def inline_css part
      html_doc = Nokogiri::HTML.parse(part.decoded)
      css_doc = parse_css_doc(html_doc)
      css_doc.each_selector_sorted(:all, :order => :desc) do |sel|
        inline_css = modify_declarations(sel.declarations.sort{|a,b| a[1].order <=> b[1].order}.map{|d| d[1].to_text }.join(''))
        html_doc.css(sel.selector).each do |element|
          element["style"] = [inline_css, element["style"]].compact.join('').strip
          element["style"] << ';' unless element["style"] =~ /;$/
        end
      end
      part.body = html_doc.to_html.strip
    end
    
    def parse_css_doc(html_doc)
      css_doc = CssParserMaster::Parser.new
      html_doc.css('style', 'link[rel=stylesheet]').each do |element|
        case element.name.downcase
        when 'style'
          css_doc.add_block!(element.content)
        when 'link'
          # TODO: handle <link> tags
        end
      end
      css_doc
    end
    
    def modify_declarations(declarations)
      declarations.gsub(/:\s+/, ':').gsub(/\s*;\s*/, ';')
    end
  end
end
