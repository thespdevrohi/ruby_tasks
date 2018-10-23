require 'csv'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--date stocks date') { |o| options[:date] = o }
  opt.on('--folder_name name of the folder where data is stored') { |o| options[:folder_name] = o.to_s }
  opt.on('--sort_column the column which to be sorted!! eg : Name or Code or Price') { |o| options[:sort_column] = o }
  opt.on('--sort_order eg: ASC|DSC') { |o| options[:sort_order] = o }
  opt.on('--name company name') { |o| options[:name] = o }
  opt.on('--code NSE code of the company') { |o| options[:code] = o }
  opt.on('--price current price of the stock') { |o| options[:price] = o.to_f }
end.parse!


insert_data = []
options.each do |key, val|
  if val != nil and key != :sort_column and key != :sort_order and key != :folder_name
    insert_data.push(val)
  end
end


fields_index = {'Price'=>1,'Name'=> 2,'Code'=> 3}

def read_csv(csv_file, index, sort_order)
  my_csv = CSV.read(csv_file)[1 .. -1]

  if index.to_i == 1 and sort_order == "DSC"
    my_csv.sort! { |a, b| a[index].to_i <=> b[index].to_i }.reverse!
  elsif index.to_i == 1 and sort_order == "ASC"
    my_csv.sort! { |a, b| a[index].to_i <=> b[index].to_i }
  elsif sort_order == "ASC"
    my_csv.sort! { |a, b| a[index] <=> b[index]}
  else
    my_csv.sort! { |a, b| a[index] <=> b[index]}.reverse!
  end

  my_csv.each { |line| p line }

end


def list_stocks(folder_name,file_name, index, sort_order)
  filenames = Dir.entries(folder_name.to_s)
  for filename in filenames
    begin
      if filename.to_s.end_with?('.csv')
        if filename.start_with?(file_name.to_s)
          read_csv(folder_name+"/"+filename, index, sort_order)
        end
      end
    rescue
      raise
    end
  end
end

def add_stock(folder_name,file_name, insert_data)

  CSV.open(folder_name+"/"+file_name, "a+") do |csv|

    csv << insert_data
  end
end

add_stock(options[:folder_name], options[:date].to_s+".csv", insert_data)
