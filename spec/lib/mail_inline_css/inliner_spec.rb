require 'spec_helper'

describe "MailInlineCss::Inliner" do
  let(:inliner) { MailInlineCss::Inliner.new }
  it "should inline CSS for HTML-only mail" do
    mail = load_mail('html_only')
    inliner.inline_css!(mail)
    compare_html_parts mail, load_mail('html_only_inlined_css')
  end
  it "should inline CSS for multipart/alternative mail" do
    mail = load_mail('multipart_alternative')
    inliner.inline_css!(mail)
    compare_html_parts mail, load_mail('multipart_alternative_inlined_css')
  end
end
