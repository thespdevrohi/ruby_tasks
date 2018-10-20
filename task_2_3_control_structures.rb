
=begin
ruby control structures are
* case
* unless
* until
* each
* infinite loop
=end

class ControlStructures

  # Constructor
  def initialize(stocks)
    @stocks = stocks
  end

  def each_cs()
    # iterate through each element in collection
    @stocks.each do |company, nse_val|
      puts "current stock value for #{company} is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"
    end
  end

  def unless_cs()
    # similar to if not
    @stocks.each do |company, nse_val|
      unless company.to_s == "ITC"
        puts "current stock value for #{company} is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"
      end
    end
  end

  def infinite_loop()
    # iterates infinite times, until break is applied
    loop {
      @stocks.each do |company, nse_val|
        break if company.to_s == "cipla"
        puts "current stock value for #{company} is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"
      end
      break
    }
  end

  def case_cs()
    # acts like a switch case, checks for each company and prints accordingly
    @stocks.each do |company, nse_val|

      case company.to_s

      when "ITC"
        puts "current stock value for ITC is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"

      when "Coal India"
        puts "current stock value for Coal India is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"

      when "cipla"
        puts "current stock value for cipla is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"

      end
    end
  end

  def until_cs()
    @stocks.each do |company, nse_val|
      until company.to_s == "Coal India"
       puts "current stock value for #{company} is #{nse_val[0].to_f} and % gain is #{nse_val[1].to_f}"
       break
      end
    end
  end

  def protected_method
    puts "Welcome to protetced method"
  end

  protected  :protected_method

end

data = {
        "Coal India": [279.85,1.25],
        "ITC": [283.65,1.27],
        "cipla": [639.75, 0.14]
      }

cs = ControlStructures.new(data)
res = cs.until_cs()
print res
