
require 'tty-box'
require 'colorize'

module ReverbTime

  ### Reverb Menu ###

  def self.reverb_menu()
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

    total_surface_area = 0.0

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

    puts "\n##### REVERBERATION TIME CALCULATOR #####".colorize(:light_yellow)
    puts "\nWelcome to the RT calculator!"
    puts "\nThis calculator displays the RT values for both the Sabine and Norris-Eyring formulas."

    puts "\nBefore we proceed, I need to know some of the room properties."
    puts "Please input the following surface areas (m2):"

    print "\nFloor / Ceiling: ".colorize(:light_green)
    ceiling_surface_area = floor_surface_area = gets.chomp.to_f

    print "\nFront / Back walls: ".colorize(:light_green)
    back_wall_surface_area = front_wall_surface_area = gets.chomp.to_f

    print "\nLeft / Right walls: ".colorize(:light_green)
    right_wall_surface_area = left_wall_surface_area = gets.chomp.to_f

    print "\nDoors: ".colorize(:light_green)
    door_surface_area = gets.chomp.to_f

    print "\nWindows: ".colorize(:light_green)
    window_surface_area = gets.chomp.to_f

    print "\nVolume of the room (m3): ".colorize(:light_green)
    room_volume = gets.chomp.to_f

    puts "\nFantastic! Now let's move on to the materials covering all the surfaces".colorize(:light_yellow)
    puts "\nPlease select one of the following materials (1-2), then hit Enter to continue:"
    puts "\nFloor:" 
    puts "\n1. Thin carpet on concrete".colorize(:light_green)
    puts "2. Wood on joists".colorize(:light_green)
    floor_type = gets.chomp.to_i
    case floor_type
    when 1
      floor_coeffs = absorption[0][:coeffs]
      floor_coeffs.each do |frequency, coeff|
        floor_absorption[frequency] = (coeff * floor_surface_area).truncate(2)
      end
    when 2
      floor_coeffs = absorption[1][:coeffs]
      floor_coeffs.each do |frequency, coeff|
        floor_absorption[frequency] = (coeff * floor_surface_area).truncate(2)
      end
    else
    end
  
    puts "\nCeiling:"
    puts "\n1. Mineral wool tiles with 180mm of airspace".colorize(:light_green)
    puts "2. Gypsum plaster titles".colorize(:light_green)
    ceiling_type = gets.chomp.to_i
    case ceiling_type
    when 1
      ceiling_coeffs = absorption[2][:coeffs]
      ceiling_coeffs.each do |frequency, coeff|
        ceiling_absorption[frequency] = (coeff * ceiling_surface_area).truncate(2)
      end
    when 2
      ceiling_coeffs = absorption[3][:coeffs]
      ceiling_coeffs.each do |frequency, coeff|
        ceiling_absorption[frequency] = (coeff * ceiling_surface_area).truncate(2)
      end
    else
    end

    puts "\nFront wall:"
    puts "\n1. Brickwork".colorize(:light_green)
    puts "2. Plasterboard".colorize(:light_green)
    front_wall_type = gets.chomp.to_i
    case front_wall_type
    when 1
      front_wall_coeffs = absorption[4][:coeffs]
      front_wall_coeffs.each do |frequency, coeff|
        front_wall_absorption[frequency] = (coeff * front_wall_surface_area).truncate(2)
      end
    when 2
      front_wall_coeffs = absorption[5][:coeffs]
      front_wall_coeffs.each do |frequency, coeff|
        front_wall_absorption[frequency] = (coeff * front_wall_surface_area).truncate(2)
      end
    else
    end

    puts "\nBack wall:"
    puts "\n1. Brickwork".colorize(:light_green)
    puts "2. Plasterboard".colorize(:light_green)
    back_wall_type = gets.chomp.to_i
    case back_wall_type
    when 1
      back_wall_coeffs = absorption[4][:coeffs]
      back_wall_coeffs.each do |frequency, coeff|
        back_wall_absorption[frequency] = (coeff * back_wall_surface_area).truncate(2)
      end
    when 2
      back_wall_coeffs = absorption[5][:coeffs]
      back_wall_coeffs.each do |frequency, coeff|
        back_wall_absorption[frequency] = (coeff * back_wall_surface_area).truncate(2)
      end
    else
    end

    puts "\nLeft wall:"
    puts "\n1. Brickwork".colorize(:light_green)
    puts "2. Plasterboard".colorize(:light_green)
    left_wall_type = gets.chomp.to_i
    case left_wall_type
    when 1
      left_wall_coeffs = absorption[4][:coeffs]
      left_wall_coeffs.each do |frequency, coeff|
        left_wall_absorption[frequency] = (coeff * left_wall_surface_area).truncate(2)
      end
    when 2
      left_wall_coeffs = absorption[5][:coeffs]
      left_wall_coeffs.each do |frequency, coeff|
        left_wall_absorption[frequency] = (coeff * left_wall_surface_area).truncate(2)
      end
    else
    end

    puts "\nRight wall:"
    puts "\n1. Brickwork".colorize(:light_green)
    puts "2. Plasterboard".colorize(:light_green)
    right_wall_type = gets.chomp.to_i
    case right_wall_type
    when 1
      right_wall_coeffs = absorption[4][:coeffs]
      right_wall_coeffs.each do |frequency, coeff|
        right_wall_absorption[frequency] = (coeff * right_wall_surface_area).truncate(2)
      end
    when 2
      right_wall_coeffs = absorption[5][:coeffs]
      right_wall_coeffs.each do |frequency, coeff|
        right_wall_absorption[frequency] = (coeff * right_wall_surface_area).truncate(2)
      end
    else
    end

    puts "\nDoors:"
    puts "\n1. Wooden with a hollow core".colorize(:light_green)
    puts "2. Solid timber".colorize(:light_green)
    door_type = gets.chomp.to_i
    case door_type
    when 1
      door_coeffs = absorption[6][:coeffs]
      door_coeffs.each do |frequency, coeff|
        door_absorption[frequency] = (coeff * door_surface_area).truncate(2)
      end
    when 2
      door_coeffs = absorption[7][:coeffs]
      door_coeffs.each do |frequency, coeff|
        door_absorption[frequency] = (coeff * door_surface_area).truncate(2)
      end
    else
    end

    puts "\nWindows:"
    puts "\n1. 4mm glass".colorize(:light_green)
    puts "2. 6mm glass".colorize(:light_green)
    window_type = gets.chomp.to_i
    case window_type
    when 1
      window_coeffs = absorption[8][:coeffs]
      window_coeffs.each do |frequency, coeff|
        window_absorption[frequency] = (coeff * window_surface_area).truncate(2)
      end
    when 2
      window_coeffs = absorption[9][:coeffs]
      window_coeffs.each do |frequency, coeff|
        window_absorption[frequency] = (coeff * window_surface_area).truncate(2)
      end
    else
    end

    all_surfaces_coeffs = []
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

    avg_absorption_coeff_125Hz = (total_absorption_125Hz / total_surface_area).truncate(2)
    avg_absorption_coeff_250Hz = (total_absorption_250Hz / total_surface_area).truncate(2)
    avg_absorption_coeff_500Hz = (total_absorption_500Hz / total_surface_area).truncate(2)
    avg_absorption_coeff_1000Hz = (total_absorption_1000Hz / total_surface_area).truncate(2)
    avg_absorption_coeff_2000Hz = (total_absorption_2000Hz / total_surface_area).truncate(2)
    avg_absorption_coeff_4000Hz = (total_absorption_4000Hz / total_surface_area).truncate(2)  

  end

  ##### Methods #####

  def self.reverb_sabine(room_volume, total_absorption)
    rt_sabine = (0.16 * volume) / total_absorption
    return "The Sabine reverberation time is %0.2f seconds.".colorize(:light_yellow) % [rt_sabine]
  end
  
  def self.reverb_eyring(room_volume, total_surface_area, avg_absorption_coeff)
    rt_eyring = (0.16 * volume) / (-2.3 * total_surface * Math.log10(1 - avg_abs_coeff))
    return "The Norris-Eyring reverberation time is %0.2f seconds.".colorize(:light_yellow) % [rt_eyring]
  end

  def self.another_calc?()
    puts "\nWould you like to make another RT calculation? (y/n)"
    try_again = gets.chomp
    case try_again 
    when 'y'
      menu()
    when 'n'
      back_to_intro?()
    else
      puts "\nInvalid input! Only (y/n) are accepted.".colorize(:red)
      another_calc?()
    end
  end

  def self.back_to_welcome?()
    puts "\nWould you like to go back to the Welcome Menu? (y/n)"
    go_back = gets.chomp
    case go_back
    when 'y'
      begin
      intro()
      rescue ArgumentError 
        menu() # Forces it to go to Reverb Menu
      end
    when 'n'
      puts "\nSee you later!".colorize(:light_yellow)
    else
      puts "\nInvalid input! Only (y/n) are accepted.".colorize(:red)
      back_to_intro?()
    end  
  end
end

ReverbTime.reverb_menu()


