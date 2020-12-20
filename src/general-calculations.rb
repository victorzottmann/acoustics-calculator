
require 'colorize'
require 'tty-prompt'
require_relative 'validators'

module General

  def self.general_calculations()
    system("clear")

    prompt = TTY::Prompt.new

    puts "\n##### GENERAL CALCULATIONS #####".colorize(:light_yellow)
    puts "\nWelcome to General Calculations!"

    options = ["Speed of Sound", "Exit"]
    input = prompt.select("\nWhat would you like to calculate?\n", options)
    
    case input 
    when "Speed of Sound"
      speed_of_sound()
    when "Exit"
      puts "\nSee you later!".colorize(:light_yellow)
      exit!
    end
  end

  def self.speed_of_sound()
    system("clear")
    
    puts "\n================================================="
    puts "\n# SPEED OF SOUND #".colorize(:light_yellow)
    
    proceed = false
    while !proceed 
      puts "\nPlease input the temperature (Celsius):".colorize(:green)
      temperature = gets.chomp.to_f
      valid_temperature = Validators.validate_temperature(temperature)
      if !valid_temperature
        Validators.invalid_number_error()
        !proceed
      else
        break
      end
    end

    speed = (331.3 * Math.sqrt(1 + (temperature / 273.15))).truncate(0)
    puts "\nThe speed of sound is #{speed} m/s.".colorize(:cyan)

    while true
      puts "\nWould you like to try again? (y/n)"
      choice = gets.chomp
      case choice
      when'y'
        speed_of_sound()
      when 'n'
        puts "\nSee you later!".colorize(:light_yellow)
        exit!
      else
        Validators.invalid_yes_no()
      end
    end 
  end

end

