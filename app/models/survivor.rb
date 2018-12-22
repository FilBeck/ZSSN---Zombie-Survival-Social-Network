class Survivor < ApplicationRecord
    has_one :inventory
    has_many :infection_reports, :class_name => "InfectionReport", :foreign_key => 'reporter_id'
    has_many :infection_reports, :class_name => "InfectionReport", :foreign_key => 'survivor_reported_id'

    def as_json(options={})
        super(include: {inventory: {only: [:water, :food, :medication, :ammunition]}} )
    end

     accepts_nested_attributes_for :inventory

     def mark_as_infected(survivor)
     	survivor.infected = 1;
     	survivor.save
     end

     def trade(inventory1, inventory2)
     	survivor1 = Survivor.find(inventory1.survivor_id)
     	
     	if survivor1.infected == 1
     		return "#{survivor1.name} is infected. Run!"
     	end

     	survivor2 = Survivor.find(inventory2.survivor_id)

		if survivor2.infected == 1
     		return "#{survivor2.name} is infected. Run!"
     	end     	

     	


     end
end
