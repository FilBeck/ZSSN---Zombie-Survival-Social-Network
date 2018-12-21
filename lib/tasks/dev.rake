namespace :dev do
  desc "Configure Dev Environment"
  task setup: :environment do
    puts "Looking for survivors....."

    30.times do |i|

      survivor_age = rand 7..70
      rand_gender = rand(0..1).to_i
      survivor_gender = if rand_gender == 0 then "M" else "F" end
      lat = rand 0..180
      lon = rand 0..180
      geo_location = {latitude: lat, longitude: lon}

      Survivor.create!(
        name: Faker::Name.name,
        age: survivor_age,
        gender: survivor_gender,
        geo_location: geo_location,
        infected: 0
      )
    end

    #arrumar essa parte do .all
    Survivor.all.each do |s|
      Inventory.create!(
        survivor_id: s.id,
        water: 0,
        food: 0,
        medication: 0,
        ammunition: 0
      )
  end


    puts "Survivors found!"
  end

end
