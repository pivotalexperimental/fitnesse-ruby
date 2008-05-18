Gem::Specification.new do |s|
  s.name = "fitnesse"
  s.version = "0.1.0"
  s.date = "2008-05-18"
  s.summary = "The fitnesse server packaged as a convenient gem (version 20070619)."
  s.email = "opensource@pivotallabs.com"
  s.homepage = "http://github.com/pivotal/fitnesse-ruby"
  s.description = "The fitnesse server packaged as a convenient gem."
  s.has_rdoc = true
  s.authors = ["Brian Takita"]
  files = ["README.markdown", "Rakefile", "fitnesse-ruby.gemspec"]
  files += Dir["bin/**/*.rb"]
  files += Dir["lib/**/*.rb"]
  files += Dir["core/fitnesse.jar"]
  files += Dir["spec/functional/**/*.rb"]
  files += ["spec/example_wiki_root"]
  s.files = files
  s.executables = ['fitnesse']
  s.test_files = Dir["spec/functional/**/*.rb"]
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["CHANGES", "README.markdown"]
end