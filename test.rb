absorption = [
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
    material: "brickwork",
    coeffs: {
      "125Hz" => 0.05,
      "250Hz" => 0.04,
      "500Hz" => 0.02,
      "1000Hz" => 0.04,
      "2000Hz" => 0.05,
      "4000Hz" => 0.05
    }
  }
]

floor_surface_area = 90.2
ceiling_surface_area = 90.2
large_walls_surface_area = 27.5
small_walls_surface_area = 20.5

floor_coeffs = absorption[0][:coeffs]
ceiling_coeffs = absorption[1][:coeffs]
large_walls_coeffs = absorption[2][:coeffs]
small_walls_coeffs = absorption[2][:coeffs]

floor_absorption = {}
ceiling_absorption = {}
large_walls_absorption = {}
small_walls_absorption = {}

floor_coeffs.each do |frequency, coeff|
  floor_absorption[frequency] = (coeff * floor_surface_area).truncate(2)
end

ceiling_coeffs.each do |frequency, coeff|
  ceiling_absorption[frequency] = (coeff * ceiling_surface_area).truncate(2)
end

large_walls_coeffs.each do |frequency, coeff|
  large_walls_absorption[frequency] = (coeff * large_walls_surface_area).truncate(2)
end

small_walls_coeffs.each do |frequency, coeff|
  small_walls_absorption[frequency] = (coeff * small_walls_surface_area).truncate(2)
end

abs_array = []
abs_array.push(floor_absorption, ceiling_absorption, large_walls_absorption, small_walls_absorption)

total_absorption_125Hz = abs_array.map{|freq| freq["125Hz"]}.inject(:+)
total_absorption_250Hz = abs_array.map{|freq| freq["250Hz"]}.inject(:+)
total_absorption_500Hz = abs_array.map{|freq| freq["500Hz"]}.inject(:+)
total_absorption_1000Hz = abs_array.map{|freq| freq["1000Hz"]}.inject(:+)
total_absorption_2000Hz = abs_array.map{|freq| freq["2000Hz"]}.inject(:+)
total_absorption_4000Hz = abs_array.map{|freq| freq["4000Hz"]}.inject(:+)

avg_absorption_125Hz = (abs_array.map{|freq| freq["125Hz"]}.inject(:+)) / abs_array.count
avg_absorption_250Hz = (abs_array.map{|freq| freq["250Hz"]}.inject(:+)) / abs_array.count
avg_absorption_500Hz = (abs_array.map{|freq| freq["500Hz"]}.inject(:+)) / abs_array.count
avg_absorption_1000Hz = (abs_array.map{|freq| freq["1000Hz"]}.inject(:+)) / abs_array.count
avg_absorption_2000Hz = (abs_array.map{|freq| freq["2000Hz"]}.inject(:+)) / abs_array.count
avg_absorption_4000Hz = (abs_array.map{|freq| freq["4000Hz"]}.inject(:+)) / abs_array.count





