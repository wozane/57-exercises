def bmi_calculator_metric(weight, height)
  bmi = weight / (height*height)
  bmi.round(2)
end

def bmi_calculator_imperial(weight, height)
  bmi = bmi_calculator_metric(weight,height) * 703
  bmi.round(2)
end

def info_request(question)
  puts question
  gets.chomp
end

def main_program
  units = info_request("If units given in Metric type `M` if imperial units type `I`").to_s.upcase
  weight = info_request('Weight:').to_f
  height = info_request('Height:').to_f

  if units == 'M'
    bmi = bmi_calculator_metric(weight, height)
    puts "Your BMI is #{bmi.round(2)}."
  elsif units == 'I'
    bmi = bmi_calculator_imperial(weight, height)
    puts "Your BMI is #{bmi}"
  else
    puts 'Please enter correct data'
  end
end

main_program
