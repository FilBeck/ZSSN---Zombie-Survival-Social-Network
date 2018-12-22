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
end
