module Gry
  class CLI
    def initialize(argv)
      @argv = argv
    end

    def run
      opt = Option.new(@argv)
      cops = opt.all ? RubocopAdapter.configurable_cops : opt.args
      analyzer = Gry::Analyzer.new(cops)
      puts YAML.dump(analyzer.analyze)
    end
  end
end
