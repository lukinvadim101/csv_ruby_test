class CsvFile
  attr_accessor :csv

  def initialize(file)
		@csv = ::CSV.read(file, headers: :true )
  end
end