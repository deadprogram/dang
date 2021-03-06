require 'stringio'

require 'rubygems'
require 'kpeg'

# require 'dang/parser'

class Dang
  VERSION = '0.1.0'

  class << self
    def it(str)
      parser = Dang::Parser.new(str, true)
      unless parser.parse
        io = StringIO.new
        parser.show_error(io)
        raise io.string
      end

      parser.output
    end
  end

end

parser = File.expand_path("../parser.kpeg", __FILE__)
KPeg.load parser, "Dang::Parser"
