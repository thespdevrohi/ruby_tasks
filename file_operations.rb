class FileOperations

  def initialize(filename)
    @file_name = filename
  end

  def write_data(content)
    aFile = File.new(@file_name, "a+")
    if aFile
       aFile.syswrite(content)
    else
       puts "Unable to open file!"
    end
  end

  def read_each_line
    begin
      IO.foreach(@file_name){|block| puts block}
    rescue
      raise 'Unable to read line from file !!'
    end
  end

  def rename_file(new_filename)
    begin
      File.rename(@file_name, new_filename)
    rescue
      raise 'Unable to rename a file !!'
  end

  def delete_file(delete_file)
    begin
      File.delete(delete_file)
    rescue
      raise 'Unable to delete a file !!'
  end
end

f = FileOperations.new("test_file_1.txt")
f.write_data("Writing data into a file !!" + "\n")
