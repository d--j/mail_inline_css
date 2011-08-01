require 'spec_helper'

describe "MailInlineCss" do
  it "should intercept a mail send by the mail gem" do
    mail = load_mail('html_only')
    mail.deliver
    compare_html_parts Mail::TestMailer.deliveries.last, load_mail('html_only_inlined_css')
  end
end
