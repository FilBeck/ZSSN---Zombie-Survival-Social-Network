class ApiStatistic < ApplicationRecord

	def self.infected_percentage(survivors)
		infected_count = 0

		survivors.each do |survivor|
			if survivor[:infected] == 1
				infected_count += 1
			end			
		end

		infected_count*100/survivors.count
	end

	def self.non_infected_percentage(infected_percentage)
		100 - infected_percentage
	end

	def self.average_resources_by_survivor(inventories)	
		total_water = 0
		total_food = 0
		total_medication = 0
		total_ammunition = 0

		inventories.each do |inventory|
			total_water += inventory[:water]
			total_food += inventory[:food]
			total_medication += inventory[:medication]
			total_ammunition += inventory[:ammunition]			
		end

		average_water = total_water/inventories.count
		average_food = total_food/inventories.count
		average_medication = total_medication/inventories.count
		average_ammunition = total_ammunition/inventories.count

		{Average_resources: [:water => average_water,
							 :food => average_food,
							 :medication => average_medication,
							 :ammunition => average_ammunition]}
	end

	def self.points_lost_to_infected(survivors)
		points = 0
		survivors.each do |survivor|
			if survivor[:infected] == 1
				inventory = Inventory.find_by(survivor_id: survivor.id)

				points += inventory[:water]*4
				points += inventory[:food]*3
				points += inventory[:medication]*2
				points += inventory[:ammunition]*1
			end			
		end

		return points
	end

end
