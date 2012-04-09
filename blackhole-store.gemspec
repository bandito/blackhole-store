$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |s|
  s.name              = "blackhole-store"
  s.version           = "0.4.0"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "A cache store that stores nothing and always reads nil"
  s.homepage          = "http://github.com/bandito/blackhole-store"
  s.email             = "george@skroutz.gr"
  s.authors           = [ "George Chatzigeorgiou" ]
  s.has_rdoc          = false

  s.files             = %w( README.markdown Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

  s.description       = <<desc
  A Cache store that does nothing
desc
end
