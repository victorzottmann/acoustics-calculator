require 'colorize'
require_relative 'validators'

def introduction()
  system("clear")
  
  # Sound pressure levels of speech in 1/1 octave-bands 
  SPEECH_LEVEL = {
    "125Hz": 49.9,
    "250Hz": 54.3,
    "500Hz": 58,
    "1000Hz": 52,
    "2000Hz": 44.8,
    "4000Hz": 38.8
  }
  
  puts "\nHello! Welcome to this simple room acoustics calculator."
  puts "\nIMPORTANT: Only measurements for rectangular rooms are acceptable at this time.".colorize(:red)
  puts "\nThe following levels of speech are used as the reference sound source:\n\n"
  SPEECH_LEVEL.each_with_index do |(freq, level), i|
    puts "- #{freq}: #{level} dB".colorize(:cyan)
  end
  
  puts "\nWhat would you like to calculate? (Select 1-4)"
  puts "\n1. Sound Pressure Level".colorize(:light_green)
  puts "2. Reverberation Time (RT)".colorize(:light_green)
  puts "3. Absorption".colorize(:light_green)
  puts "4. Transmission Loss".colorize(:light_green)
  
  input = gets.chomp.to_i
  valid_input = Validators.validate_input(input)
  
  case input
  when 1
    # Sound level
  when 2
    # RT
  when 3
    # Absorption
  when 4
    # Transmission loss
  else
    if !valid_input
      puts "\nInvalid input".colorize(:red)
      puts "Type any key to continue"
      gets
      introduction()
    end
  end

end

introduction()



