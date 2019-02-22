Gem::Specification.new do |s|
  s.name = "fitnesse-ruby"
  s.version = "0.4.0"
  s.date = "2019-02-22"
  s.summary = "The fitnesse server packaged as a convenient gem (version 20190216)."
  s.email = "reed@doctible.com"
  s.homepage = "http://github.com/Doctible/fitnesse-ruby"
  s.description = "The fitnesse server packaged as a convenient gem."
  s.has_rdoc = true
  s.authors = ["Brian Takita", "Reed Law"]
  files = [
    "README.markdown", "Rakefile", "fitnesse-ruby.gemspec", "bin/fitnesse",
    "lib/fitnesse.rb", "core/fitnesse.jar", "spec/example_wiki_root",
    "spec/functional/spec_helper.rb", "spec/functional/fitnesse_spec.rb"
  ]
  s.files = files
  s.executables = ['fitnesse']
  s.test_files = ["spec/functional/fitnesse_spec.rb"]
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["CHANGES", "README.markdown"]
end
