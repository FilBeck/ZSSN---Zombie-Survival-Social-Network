namespace :dev do
  desc "Configure Dev Environment"
  task setup: :environment do
    puts "Looking for survivors....."

    30.time do |i|
      Survivor.create!(
        name: Faker::Name.name,
        age: rand 7..70,
        gender: rand 0..1 == 0 ? 'M' : 'F',
        geo_location: {latitude: rand 0..180 , longitude: rand 0..180 }
      )
    end

    puts "Survivors found!"
  end

end
