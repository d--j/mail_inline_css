require 'spec_helper'

describe "MailInlineCss::Interceptor" do
  let(:mail) { Mail.new }
  let(:interceptor) { MailInlineCss::Interceptor.new }
  it "should return true" do
    interceptor.inliner.should_receive(:inline_css!).with(mail)
    interceptor.delivering_email(mail).should be_true
  end
end
