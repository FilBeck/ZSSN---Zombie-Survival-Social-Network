# Zombie Survival Social Network

"The world as we know it has fallen into an apocalyptic scenario. A laboratory-made virus is transforming human beings and animals into zombies, hungry for fresh flesh."
I (the last survivor who knows how to code), was designated to develop a system to share resources between non-infected humans. 

Download the project as soon as you find somewhere energized to use computers and run:
> rails s

Then your "localhost:3000" address will be able to host the social network (an iminent zombie wave was detected near the development area of this system, so it couldn't be changed in time)

## Add and retrieve survivors

The most important goal of this project is to find another survivors to help along in this harsh situation. To get the full list of registered people, use the following endpoint:

> localhost:3000/survivors/

Whenever you find another person (preferably not infected) be sure to add them to the network, using the following POST request to that same address:
> {
    "name": "Reginaldo Rotten",
    "age": 69,
    "gender": "M",
    "infected": 0,
    "geo_location": "{:latitude=>73, :longitude=>92}",
    "inventory_attributes": {
	"water": 10,
	"food": 34,
	"medication": 8,
	"ammunition": "15"
    }

You should put the coordinates of the survivor, as well as their personal goods they can share afterwards. Once registerd, a survivor location can be updated by informing their new "geo_location" through a PUT request to the address:
> localhost:3000/survivors/:survivor_id


## Trading itens

Negotiations are key even in the middle of the zombie apocalypse. Two survivors may find convenient to switch some goods for their own good (pun intended). Send a PUT request to "localhost:3000/survivors/:survivor_id/inventories/trade" containing the JSON, as follows:
>{
	"trade_survivor_1": {
	"survivor_id":1,
	    "water": 10,
	    "food": 0,
	    "medication": 5,
	    "ammunition": 0
	},
	"trade_survivor_2": {
		"survivor_id":4,
	    "water": 0,
	    "food": 15,
	    "medication": 0,
	    "ammunition": 5
	}
}

The itens in the inventories are worth points, so only fair trades are allowed. These are the current values of the items:
Water - 4
Food - 3
Medication - 2
Ammunition - 1

## Report a survivor as infected

Unfortunately, nobody is totally safe from becoming a brainless brain-hunter. The social network has the feature to make reports as someone start to behave "differently". After 3 reports (from distinct users) this person would be considered infected (a zombie) and will no longer be able to make any trades with other survivors.
To make a report, send a POST request to the following address:
> localhost:3000/infection_reports

The JSON content should have the ID of the reported and the survivor being reported:
>{
    "reporter_id":2,
    "survivor_reported_id":4
}
