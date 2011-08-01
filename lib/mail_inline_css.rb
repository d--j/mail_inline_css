require 'mail'

module MailInlineCss
  autoload :Interceptor, 'mail_inline_css/interceptor'
  autoload :Inliner, 'mail_inline_css/interceptor'
end
Mail.register_interceptor(MailInlineCss::Interceptor.new)
