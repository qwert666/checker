Gem::Specification.new do |s|
  s.name        = 'checker'
  s.version     = '0.0.1'
  s.date        = '2012-04-03'
  s.summary     = "Syntax checker for various files"
  s.description = "A collection of modules which every is designed to check syntax for specific files."
  s.authors     = ["Jacek Jakubik"]
  s.email       = 'jacek.jakubik@netguru.pl'
  s.files       = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage    = 'http://github.com/netguru/checker'
end
