require File.expand_path("#{dir = File.dirname(__FILE__)}/spec_helper")

describe "A Fitnesse server" do
  attr_reader :port, :driver
  before do
    @port = 8081
    stop_server
  end

  after do
    driver.stop if driver
    stop_server
  end

  it "starts a Fitnesse server" do
    start_server
    @driver = Selenium::SeleniumDriver.new(
      'localhost',
      4444,
      '*firefox',
      "http://localhost:#{port}"
    )
    driver.start
    driver.open('/')

    wait_for do
      driver.is_text_present("Welcome to the Wonderful World of FitNesse!")
    end
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