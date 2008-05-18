class Fitnesse
  attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def start
    system "java -cp #{jar_path} fitnesse.FitNesse #{argv.join(' ')}"
  end

  def jar_path
    dir = File.dirname(__FILE__)
    File.expand_path("#{dir}/../core/fitnesse.jar")
  end
end

#Process.fork{system "java -cp vendor/fitnesse/fitnesse.jar fitnesse.FitNesse -o -e 0 -p 8081 -r test/fitnesse/WikiRoot"}