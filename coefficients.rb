##### Absorptions Coefficients #####

##################### Masonry Walls #####################


module Coeffs

  rough_concrete = {
    "125Hz": 0.02,
    "250Hz": 0.03,
    "500Hz": 0.03,
    "1000Hz": 0.03,
    "2000Hz": 0.04,
    "4000Hz": 0.07
  }
  
  smooth_concrete = {
    "125Hz": 0.01,
    "250Hz": 0.01,
    "500Hz": 0.01,
    "1000Hz": 0.02,
    "2000Hz": 0.02,
    "4000Hz": 0.02
  }
  
  standard_brickwork = {
    "125Hz": 0.05,
    "250Hz": 0.04,
    "500Hz": 0.02,
    "1000Hz": 0.04,
    "2000Hz": 0.05,
    "4000Hz": 0.05
  }
  
  
  ##################### Mineral Wool and Foams for Walls #####################
  
  # gw = Glass wool
  gw_25mm_16kg = {
    "125Hz": 0.12,
    "250Hz": 0.28,
    "500Hz": 0.55,
    "1000Hz": 0.71,
    "2000Hz": 0.74,
    "4000Hz": 0.83
  }
  
  gw_50mm_16kg = {
    "125Hz": 0.17,
    "250Hz": 0.45,
    "500Hz": 0.80,
    "1000Hz": 0.89,
    "2000Hz": 0.97,
    "4000Hz": 0.94
  }
  
  gw_75mm_16kg = {
    "125Hz": 0.30,
    "250Hz": 0.69,
    "500Hz": 0.94,
    "1000Hz": 1.00,
    "2000Hz": 1.00,
    "4000Hz": 1.00
  }
  
  gw_100mm_16kg = {
    "125Hz": 0.43,
    "250Hz": 0.86,
    "500Hz": 1.00,
    "1000Hz": 1.00,
    "2000Hz": 1.00,
    "4000Hz": 1.00
  }
  
  fiberglass = {
    "125Hz": 0.43,
    "250Hz": 0.86,
    "500Hz": 1.00,
    "1000Hz": 1.00,
    "2000Hz": 1.00,
    "4000Hz": 1.00
  }
  
  plasterboard = {
    "125Hz": 0.15,
    "250Hz": 0.01,
    "500Hz": 0.06,
    "1000Hz": 0.04,
    "2000Hz": 0.04,
    "4000Hz": 0.05
  }
  
  
  ##################### Glass and Glazing #####################
  
  four_mm_glass = {
    "125Hz": 0.30,
    "250Hz": 0.20,
    "500Hz": 0.10,
    "1000Hz": 0.07,
    "2000Hz": 0.05,
    "4000Hz": 0.02
  }
  
  six_mm_glass = {
    "125Hz": 0.10,
    "250Hz": 0.06,
    "500Hz": 0.04,
    "1000Hz": 0.03,
    "2000Hz": 0.02,
    "4000Hz": 0.02
  }
  
  
  ##################### Floors #####################
  
  thin_carpet_concrete = {
    "125Hz": 0.10,
    "250Hz": 0.15,
    "500Hz": 0.25,
    "1000Hz": 0.30,
    "2000Hz": 0.30,
    "4000Hz": 0.30
  }
  
  thin_carpet_wood = {
    "125Hz": 0.20,
    "250Hz": 0.25,
    "500Hz": 0.30,
    "1000Hz": 0.30,
    "2000Hz": 0.30,
    "4000Hz": 0.30
  }
  
  wooden_floor_joists = {
    "125Hz": 0.15,
    "250Hz": 0.11,
    "500Hz": 0.10,
    "1000Hz": 0.07,
    "2000Hz": 0.06,
    "4000Hz": 0.07
  }
  
  vinyl_stuck_concrete = {
    "125Hz": 0.02,
    "250Hz": 0.02,
    "500Hz": 0.03,
    "1000Hz": 0.04,
    "2000Hz": 0.04,
    "4000Hz": 0.05
  }
  
  rubber_tiles = {
    "125Hz": 0.05,
    "250Hz": 0.05,
    "500Hz": 0.10,
    "1000Hz": 0.10,
    "2000Hz": 0.05,
    "4000Hz": 0.05
  }
  
  
  ##################### Ceilings #####################
  
  mineral_wool_tiles = {
    "125Hz": 0.06,
    "250Hz": 0.40,
    "500Hz": 0.75,
    "1000Hz": 0.95,
    "2000Hz": 0.96,
    "4000Hz": 0.83
  }
  
  gypsum_plaster_tiles = {
    "125Hz": 0.45,
    "250Hz": 0.70,
    "500Hz": 0.80,
    "1000Hz": 0.80,
    "2000Hz": 0.65,
    "4000Hz": 0.45
  }
  
  metal_30mm_rockwool = {
    "125Hz": 0.12,
    "250Hz": 0.45,
    "500Hz": 0.87,
    "1000Hz": 0.98,
    "2000Hz": 1.00,
    "4000Hz": 1.00
  }
  
  decorative_plaster_ceiling = {
    "125Hz": 0.20,
    "250Hz": 0.22,
    "500Hz": 0.18,
    "1000Hz": 0.15,
    "2000Hz": 0.15,
    "4000Hz": 0.16
  }
  
  woodwool_75mm_gap_25mm = {
    "125Hz": 0.30,
    "250Hz": 0.40,
    "500Hz": 0.50,
    "1000Hz": 0.85,
    "2000Hz": 0.50,
    "4000Hz": 0.65
  }
  
  
  ##################### Doors #####################
  
  wood_hollow_door = {
    "125Hz": 0.30,
    "250Hz": 0.25,
    "500Hz": 0.15,
    "1000Hz": 0.10,
    "2000Hz": 0.10,
    "4000Hz": 0.07
  }
  
  solid_timber_door = {
    "125Hz": 0.14,
    "250Hz": 0.10,
    "500Hz": 0.06,
    "1000Hz": 0.08,
    "2000Hz": 0.10,
    "4000Hz": 0.10
  }
  
  
  ##################### Audience and Sitting #####################
  
  adult_seated = {
    "125Hz": 0.33,
    "250Hz": 0.40,
    "500Hz": 0.44,
    "1000Hz": 0.45,
    "2000Hz": 0.45,
    "4000Hz": 0.45
  }
  
  upholstered_seat_unoccupied = {
    "125Hz": 0.07,
    "250Hz": 0.12,
    "500Hz": 0.26,
    "1000Hz": 0.42,
    "2000Hz": 0.50,
    "4000Hz": 0.55
  }
  
  upholstered_seat_occupied = {
    "125Hz": 0.32,
    "250Hz": 0.62,
    "500Hz": 0.74,
    "1000Hz": 0.76,
    "2000Hz": 0.81,
    "4000Hz": 0.90
  }
  
  leather_seats = {
    "125Hz": 0.40,
    "250Hz": 0.50,
    "500Hz": 0.58,
    "1000Hz": 0.61,
    "2000Hz": 0.58,
    "4000Hz": 0.50
  }
  
  plastic_chairs = {
    "125Hz": 0.20,
    "250Hz": 0.25,
    "500Hz": 0.30,
    "1000Hz": 0.30,
    "2000Hz": 0.30,
    "4000Hz": 0.30
  }
  
  wooden_chairs = {
    "125Hz": 0.08,
    "250Hz": 0.00,
    "500Hz": 0.15,
    "1000Hz": 0.00,
    "2000Hz": 0.18,
    "4000Hz": 0.20
  }
end


