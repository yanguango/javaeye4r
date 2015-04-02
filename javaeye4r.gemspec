Gem::Specification.new do |s|  
  s.name = %q{javaeye4r}  
  s.version = "0.1.0"  
  
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=  
  s.authors = ["yanguango"]  
  s.date = %q{2010-3-31}  
  s.description = %q{A ruby client for JavaEye api}  
  s.email = %q{yanguango@gmail.com}  
  s.files = ["README",
    "lib/javaeye4r.rb", 
    "lib/javaeye.rb", 
    "lib/javaeye/base.rb", 
    "lib/javaeye/chat.rb",
    "lib/javaeye/client.rb",
    "lib/javaeye/user.rb", 
    "javaeye4r.gemspec"]  
  s.homepage = %q{http://github.com/yanguango/javaeye4r}
  s.require_paths = ["lib"]  
  s.rubygems_version = %q{0.1.1}  
  s.summary = %q{A ruby client for JavaEye api}  
  
  if s.respond_to? :specification_version then  
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION  
    s.specification_version = 4
  
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then  
    else  
    end  
  else  
  end  
end