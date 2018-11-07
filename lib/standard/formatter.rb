require "rubocop"

module Standard
  class Formatter < RuboCop::Formatter::BaseFormatter
    def file_finished(file, offenses)
      print_header_once if offenses.size > 0

      offenses.each do |o|
        output.printf("  %s:%d:%d: %s\n", file, o.line, o.real_column, o.message.tr("\n", ' '))
      end
    end

    private

    def print_header_once
      return if @header_printed_already
      output.print <<~HEADER
          standard: Use Ruby Standard Style (https://github.com/testdouble/standard)
          standard: Run `standard --fix` to automatically fix some problems.
      HEADER
      @header_printed_already = true
    end
  end
end
