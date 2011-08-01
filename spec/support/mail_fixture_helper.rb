module MailFixtureHelper
  def load_mail fixture_name
    Mail.read(File.expand_path(File.join(File.dirname(__FILE__), '..', 'fixtures', "#{fixture_name}.eml")))
  end
  
  def compare_html_parts mail1, mail2
    mail1.content_type.should == mail2.content_type
    mail1.parts.size.should == mail2.parts.size
    if mail1.main_type == 'text' && mail1.sub_type == 'html'
      mail1.decoded.should == mail2.decoded
    else
      mail1_parts = mail1.all_parts
      mail2_parts = mail2.all_parts
      mail1_parts.size.should == mail2_parts.size
      for i in 0..mail1_parts.size-1
        mail1_parts[i].decoded.should == mail2_parts[i].decoded if mail1_parts[i].mime_type == 'text/html' && !mail1_parts[i].attachment?
      end
    end
  end
end
