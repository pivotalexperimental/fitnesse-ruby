require File.expand_path("#{dir = File.dirname(__FILE__)}/spec_helper")

describe "A Fitnesse server" do
  attr_reader :port
  before do
    @port = 8081
    stop_server
  end

  after do
    stop_server
  end

  it "starts a Fitnesse server" do
    start_server
    agent = WWW::Mechanize.new
    page = agent.get("http://localhost:#{port}")

    page.body.should include("Welcome to the Wonderful World of FitNesse!")
  end

  def wait_for
    Timeout.timeout(5) do
      loop do
        break if yield
        sleep 0.25
      end
    end
  end

  def start_server
    dir = File.dirname(__FILE__)
    Thread.start do
      Fitnesse.new(['-p', port, '-r', "spec/example_wiki_root"]).start
    end

    wait_for do
      Lsof.running?(port)
    end
  end

  def stop_server
    if Lsof.running?(port)
      Lsof.kill(port)

      wait_for do
        !Lsof.running?(port)
      end
    end
  end
end