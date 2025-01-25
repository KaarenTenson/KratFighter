extends Node2D
@onready var textures = []
@onready var spawns = [$"Spawns (11 kokku)/mets1/Node2D", $"Spawns (11 kokku)/peenar1/Node2D", $"Spawns (11 kokku)/koobas2/Node2D", $"Spawns (11 kokku)/koobas1/Node2D", $"Spawns (11 kokku)/maja2/Node2D", $"Spawns (11 kokku)/maja1/Node2D", $"Spawns (11 kokku)/küngas1/Node2D", $"Spawns (11 kokku)/järv2/Node2D", $"Spawns (11 kokku)/järv1/Node2D", $"Spawns (11 kokku)/peenar2/Node2D", $"Spawns (11 kokku)/küngas2/Node2D"]

func getTextures():
	for i in range(ItemManager.items_dict.size()):
		if ItemManager.items_dict[i].default:
			print("get ignored")
		else:
			textures.append(ItemManager.items_dict[i].texture)

func _ready():
	getTextures()
	print(textures)
	for i in range(spawns.size()):
		var randomnessFactor = (randi() % textures.size() - 1)
		spawns[i].icon = textures[randomnessFactor]
