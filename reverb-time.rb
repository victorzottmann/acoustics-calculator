
require 'colorize'
require 'tty-box'
require_relative 'validators'

module ReverbTime

  def self.reverb_calculations()
    system ("clear")

    ##### Absorption Coefficients #####
  
    absorption = [
    
      ## Floor
      {
        material: "thin_carpet_concrete",
        coeffs: {
          "125Hz" => 0.10,
          "250Hz" => 0.15,
          "500Hz" => 0.25,
          "1000Hz" => 0.30,
          "2000Hz" => 0.30,
          "4000Hz" => 0.30
        }
      },
      
      {
        material: "wooden_floor_joists",
        coeffs: {
          "125Hz" => 0.15,
          "250Hz" => 0.11,
          "500Hz" => 0.10,
          "1000Hz" => 0.07,
          "2000Hz" => 0.06,
          "4000Hz" => 0.07
        }
      },
    
      ## Ceiling
      {
        material: "mineral_wool_tiles",
        coeffs: {
          "125Hz" => 0.06,
          "250Hz" => 0.40,
          "500Hz" => 0.75,
          "1000Hz" => 0.95,
          "2000Hz" => 0.96,
          "4000Hz" => 0.83
        }
      },
    
      {
        material: "gypsum_plaster_tiles",
        coeffs: {
          "125Hz" => 0.45,
          "250Hz" => 0.70,
          "500Hz" => 0.80,
          "1000Hz" => 0.80,
          "2000Hz" => 0.65,
          "4000Hz" => 0.45
        }
      },
    
      ## Walls
      {
        material: "brickwork",
        coeffs: {
          "125Hz" => 0.05,
          "250Hz" => 0.04,
          "500Hz" => 0.02,
          "1000Hz" => 0.04,
          "2000Hz" => 0.05,
          "4000Hz" => 0.05
        }
      },
    
      {
        material: "plasterboard",
        coeffs: {
          "125Hz" => 0.15,
          "250Hz" => 0.01,
          "500Hz" => 0.06,
          "1000Hz" => 0.04,
          "2000Hz" => 0.04,
          "4000Hz" => 0.05
        }
      },
    
      ## Doors
      {
        material: "wood_hollow_door",
        coeffs: {
          "125Hz" => 0.30,
          "250Hz" => 0.25,
          "500Hz" => 0.15,
          "1000Hz" => 0.10,
          "2000Hz" => 0.10,
          "4000Hz" => 0.07
        }
      },
    
      {
        material: "timber_solid_door",
        coeffs: {
          "125Hz" => 0.14,
          "250Hz" => 0.10,
          "500Hz" => 0.06,
          "1000Hz" => 0.08,
          "2000Hz" => 0.10,
          "4000Hz" => 0.10
        }
      },
    
      ## Windows
      {
        material: "four_mm_glass",
        coeffs: {
          "125Hz" => 0.30,
          "250Hz" => 0.20,
          "500Hz" => 0.10,
          "1000Hz" => 0.07,
          "2000Hz" => 0.05,
          "4000Hz" => 0.02
        }
      },
    
      {
        material: "six_mm_glass",
        coeffs: {
          "125Hz" => 0.10,
          "250Hz" => 0.06,
          "500Hz" => 0.04,
          "1000Hz" => 0.03,
          "2000Hz" => 0.02,
          "4000Hz" => 0.02
        }
      },
    ]

    floor_coeffs = {}
    ceiling_coeffs = {}
    front_wall_coeffs = {}
    back_wall_coeffs = {}
    left_wall_coeffs = {}
    right_wall_coeffs = {}
    door_coeffs = {}
    window_coeffs = {}

    floor_absorption = {}
    ceiling_absorption = {}
    front_wall_absorption = {}
    back_wall_absorption = {}
    left_wall_absorption = {}
    right_wall_absorption = {}
    door_absorption = {}
    window_absorption = {}

    total_surface_area = 0.0

    puts "\n##### REVERBERATION TIME CALCULATOR #####".colorize(:light_yellow)
    puts "\nWelcome to the RT calculator!"
    puts "\nThis calculator displays the Reverberation Time given the dimensions and total absorption of the room."
    puts "IMPORTANT: It is assumed that the room is rectangular.".colorize(:light_yellow)

    puts "\nBefore we proceed, I need to know some of the properties of the room."
    puts "\nPlease input the following SURFACE AREAS (m2):\n\n"
    
    proceed = false

    while !proceed
      print "Floor / Ceiling: ".colorize(:light_green)
      ceiling_surface_area = floor_surface_area = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(floor_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end

    while !proceed
      print "\nFront / Back walls: ".colorize(:light_green)
      back_wall_surface_area = front_wall_surface_area = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(front_wall_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end

    while !proceed
      print "\nLeft / Right walls: ".colorize(:light_green)
      right_wall_surface_area = left_wall_surface_area = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(left_wall_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end

    while !proceed
      print "\nDoors: ".colorize(:light_green)
      door_surface_area = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(door_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end

    while !proceed
      print "\nWindows: ".colorize(:light_green)
      window_surface_area = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(window_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end

    while !proceed
      print "\nVolume of the room (m3): ".colorize(:light_green)
      room_volume = gets.chomp.to_f
      valid_area = Validators.validate_surface_area(floor_surface_area)
      if !valid_area
        repeat_input()
        !proceed
      else
        break
      end
    end
   
    puts "\nFantastic! Now let's move on to the materials covering all the surfaces".colorize(:light_yellow)
    puts "\nPlease select one of the following materials (1-2), then hit Enter to continue:"

    while true
      puts "\nFloor:" 
      puts "\n1. Thin carpet on concrete".colorize(:light_green)
      puts "2. Wood on joists".colorize(:light_green)
      floor_type = gets.chomp.to_i
      case floor_type
      when 1
        absorption.each do |item|
         if item[:material] == "thin_carpet_concrete"
          floor_coeffs = item[:coeffs]
         end
        end
        floor_coeffs.each do |frequency, coeff|
          floor_absorption[frequency] = (coeff * floor_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "wooden_floor_joists"
           floor_coeffs = item[:coeffs]
          end
         end
        floor_coeffs.each do |frequency, coeff|
          floor_absorption[frequency] = (coeff * floor_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end
  
    while true
      puts "\nCeiling:"
      puts "\n1. Mineral wool tiles with 180mm of airspace".colorize(:light_green)
      puts "2. Gypsum plaster titles".colorize(:light_green)
      ceiling_type = gets.chomp.to_i
      case ceiling_type
      when 1
        absorption.each do |item|
          if item[:material] == "mineral_wool_tiles"
           ceiling_coeffs = item[:coeffs]
          end
         end
        ceiling_coeffs.each do |frequency, coeff|
          ceiling_absorption[frequency] = (coeff * ceiling_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "gypsum_plaster_tiles"
           ceiling_coeffs = item[:coeffs]
          end
         end
        ceiling_coeffs.each do |frequency, coeff|
          ceiling_absorption[frequency] = (coeff * ceiling_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nFront wall:"
      puts "\n1. Brickwork".colorize(:light_green)
      puts "2. Plasterboard".colorize(:light_green)
      front_wall_type = gets.chomp.to_i
      case front_wall_type
      when 1
        absorption.each do |item|
          if item[:material] == "brickwork"
           front_wall_coeffs = item[:coeffs]
          end
         end
        front_wall_coeffs.each do |frequency, coeff|
          front_wall_absorption[frequency] = (coeff * front_wall_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "plasterboard"
           front_wall_coeffs = item[:coeffs]
          end
         end
        front_wall_coeffs.each do |frequency, coeff|
          front_wall_absorption[frequency] = (coeff * front_wall_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nBack wall:"
      puts "\n1. Brickwork".colorize(:light_green)
      puts "2. Plasterboard".colorize(:light_green)
      back_wall_type = gets.chomp.to_i
      case back_wall_type
      when 1
        absorption.each do |item|
          if item[:material] == "brickwork"
           back_wall_coeffs = item[:coeffs]
          end
         end
        back_wall_coeffs.each do |frequency, coeff|
          back_wall_absorption[frequency] = (coeff * back_wall_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "plasterboard"
           back_wall_coeffs = item[:coeffs]
          end
         end
        back_wall_coeffs.each do |frequency, coeff|
          back_wall_absorption[frequency] = (coeff * back_wall_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nLeft wall:"
      puts "\n1. Brickwork".colorize(:light_green)
      puts "2. Plasterboard".colorize(:light_green)
      left_wall_type = gets.chomp.to_i
      case left_wall_type
      when 1
        absorption.each do |item|
          if item[:material] == "brickwork"
           left_wall_coeffs = item[:coeffs]
          end
         end
        left_wall_coeffs.each do |frequency, coeff|
          left_wall_absorption[frequency] = (coeff * left_wall_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "plasterboard"
           left_wall_coeffs = item[:coeffs]
          end
         end
        left_wall_coeffs.each do |frequency, coeff|
          left_wall_absorption[frequency] = (coeff * left_wall_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nRight wall:"
      puts "\n1. Brickwork".colorize(:light_green)
      puts "2. Plasterboard".colorize(:light_green)
      right_wall_type = gets.chomp.to_i
      case right_wall_type
      when 1
        absorption.each do |item|
          if item[:material] == "brickwork"
           right_wall_coeffs = item[:coeffs]
          end
         end
        right_wall_coeffs.each do |frequency, coeff|
          right_wall_absorption[frequency] = (coeff * right_wall_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "plasterboard"
           right_wall_coeffs = item[:coeffs]
          end
         end
        right_wall_coeffs.each do |frequency, coeff|
          right_wall_absorption[frequency] = (coeff * right_wall_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nDoors:"
      puts "\n1. Wooden with a hollow core".colorize(:light_green)
      puts "2. Solid timber".colorize(:light_green)
      door_type = gets.chomp.to_i
      case door_type
      when 1
        absorption.each do |item|
          if item[:material] == "wood_hollow_door"
           door_coeffs = item[:coeffs]
          end
         end
        door_coeffs.each do |frequency, coeff|
          door_absorption[frequency] = (coeff * door_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "timber_solid_door"
           door_coeffs = item[:coeffs]
          end
         end
        door_coeffs.each do |frequency, coeff|
          door_absorption[frequency] = (coeff * door_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    while true
      puts "\nWindows:"
      puts "\n1. 4mm glass".colorize(:light_green)
      puts "2. 6mm glass".colorize(:light_green)
      window_type = gets.chomp.to_i
      case window_type
      when 1
        absorption.each do |item|
          if item[:material] == "four_mm_glass"
           window_coeffs = item[:coeffs]
          end
         end
        window_coeffs.each do |frequency, coeff|
          window_absorption[frequency] = (coeff * window_surface_area).truncate(2)
        end
        break
      when 2
        absorption.each do |item|
          if item[:material] == "six_mm_glass"
           window_coeffs = item[:coeffs]
          end
         end
        window_coeffs.each do |frequency, coeff|
          window_absorption[frequency] = (coeff * window_surface_area).truncate(2)
        end
        break
      else
        invalid_input()
      end
    end

    all_surfaces_coeffs = Array.new
    all_surfaces_coeffs.push(
      floor_absorption, 
      ceiling_absorption, 
      front_wall_absorption, 
      back_wall_absorption, 
      left_wall_absorption, 
      right_wall_absorption, 
      door_absorption, 
      window_absorption
    )

    total_absorption_125Hz = all_surfaces_coeffs.map{|freq| freq["125Hz"]}.inject(:+)
    total_absorption_250Hz = all_surfaces_coeffs.map{|freq| freq["250Hz"]}.inject(:+)
    total_absorption_500Hz = all_surfaces_coeffs.map{|freq| freq["500Hz"]}.inject(:+)
    total_absorption_1000Hz = all_surfaces_coeffs.map{|freq| freq["1000Hz"]}.inject(:+)
    total_absorption_2000Hz = all_surfaces_coeffs.map{|freq| freq["2000Hz"]}.inject(:+)
    total_absorption_4000Hz = all_surfaces_coeffs.map{|freq| freq["4000Hz"]}.inject(:+)

    total_absorption = {
      "125Hz" => total_absorption_125Hz,
      "250Hz" => total_absorption_250Hz,
      "500Hz" => total_absorption_500Hz,
      "1000Hz" => total_absorption_1000Hz,
      "2000Hz" => total_absorption_2000Hz,
      "4000Hz" => total_absorption_4000Hz
    }

    puts "\nABSORPTION VALUES:".colorize(:light_yellow)

    puts "\nThe total absorption per octave band is:\n\n"
    net_absorption = 0.0
    total_absorption.each do |octave, absorption|
      puts "- #{octave}: #{absorption.truncate(2)} m2".colorize(:cyan)
      net_absorption += absorption
    end
    puts "\nThe total absortion is: %.2f m2" % [net_absorption]

    puts "\nREVERB TIME VALUES:".colorize(:light_yellow)

    puts "\nReverb times for each octave band:\n\n"
    reverb_octave_bands = Hash.new
    total_absorption.each do |octave, absorption|
      reverb_time = reverb_time(room_volume, absorption)
      puts "- #{octave}: #{reverb_time} seconds".colorize(:cyan)
      reverb_octave_bands[octave] = reverb_time
    end
    mid_average = ((reverb_octave_bands["500Hz"] + reverb_octave_bands["1000Hz"]) / 2)
    puts "\nThe mid-frequency average (500Hz and 1000Hz) is: %.2f seconds" % [mid_average]

    another_calculation?()
  end

  ##### Methods ####
  def reverb_time(room_volume, absorption)
    rt = ((0.16 * room_volume) / absorption).truncate(2)
    return rt
  end

  ##### Input Verifications #####
  def self.invalid_input()
    puts "\nInvalid input!".colorize(:red)
    puts "Only 1 and 2 are accepted."
    puts "Press any key to continue"
    gets
  end

  def self.repeat_input()
    puts "\nInvalid input!".colorize(:red)
    puts "Only numbers above 0 are accepted"
    puts "Press any key to continue"
    gets
  end

  ##### Repeat? #####
  def self.another_calculation?()
    puts "\nWould you like to make another RT calculation? (y/n)".colorize(:light_green)
    try_again = gets.chomp
    case try_again 
    when 'y'
      reverb_calculations()
    when 'n'
      puts "\nSee you later!".colorize(:light_yellow)
      exit!
    else
      puts "\nInvalid input! Only (y/n) are accepted.".colorize(:red)
      another_calculation?()
    end
  end

end
