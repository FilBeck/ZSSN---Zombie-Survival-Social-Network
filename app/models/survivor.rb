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

     def self.get_inventory(survivor_id)
     	Inventory.find_by(survivor_id: survivor_id)
     end

     def self.trade(tradeInventory1, tradeInventory2)	
     	survivor1 = Survivor.find(tradeInventory1[:survivor_id])

     	if survivor1.infected == 1
     		return "#{survivor1.name} is infected. Run!"
     	end

     	survivor2 = Survivor.find(tradeInventory2[:survivor_id])

		if survivor2.infected == 1
     		return "#{survivor2.name} is infected. Run!"
     	end

     	trade_value_1 = tradeInventory1[:water]*4 + tradeInventory1[:food]*3 + tradeInventory1[:medication]*2 + tradeInventory1[:ammunition]*1
     	trade_value_2 = tradeInventory2[:water]*4 + tradeInventory2[:food]*3 + tradeInventory2[:medication]*2 + tradeInventory2[:ammunition]*1

     	if trade_value_1 != trade_value_2
     		return "The trades must be equivalent (no cheating)"
     	end

     	survivor_inventory_1 = Survivor.get_inventory(survivor1[:id])
     	survivor_inventory_2 = Survivor.get_inventory(survivor2[:id])

     	survivor_inventory_1[:water] -= tradeInventory1[:water] + tradeInventory2[:water]
     	survivor_inventory_1[:food] -= tradeInventory1[:food] + tradeInventory2[:food]
     	survivor_inventory_1[:medication] -= tradeInventory1[:medication] + tradeInventory2[:medication]
     	survivor_inventory_1[:ammunition] -= tradeInventory1[:ammunition] + tradeInventory2[:ammunition]

     	survivor_inventory_2[:water] -= tradeInventory2[:water] + tradeInventory1[:water]
     	survivor_inventory_2[:food] -= tradeInventory2[:food] + tradeInventory1[:food]
     	survivor_inventory_2[:medication] -= tradeInventory2[:medication] + tradeInventory1[:medication]
     	survivor_inventory_2[:ammunition] -= tradeInventory2[:ammunition] + tradeInventory1[:ammunition]

     	survivor_inventory_1.save
     	survivor_inventory_2.save

     	"Trades finished succesfully! (Better find a safe place, now...)"

     end
     
end
