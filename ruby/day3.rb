class CsvRow
  attr_accessor :vals
  def initialize headers, row
    @vals = {}
    for i in 0..headers.length
      puts row[0]
      @vals[headers[i]] = row[i]
    end
  end

  def method_missing name, *args
    val = name.to_s
    return @vals[val]
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(headers, row.chomp.split(', '))
      end
    end

    def each
      csv_contents.each {|r| yield r}
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end



m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}
