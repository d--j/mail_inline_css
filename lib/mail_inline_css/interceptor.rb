require 'mail_inline_css/inliner'

module MailInlineCss
  class Interceptor
    attr_reader :inliner
    
    def initialize
      @inliner = Inliner.new
    end
    
    def delivering_email(mail)
      inliner.inline_css!(mail)
      true # not necessary at the moment but maybe in the future interceptors can really intercept a message?
    end
    
  end
end
