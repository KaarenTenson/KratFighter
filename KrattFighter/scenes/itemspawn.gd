extends Node2D
@onready var textures = []
@onready var spawns = [$"Spawns (11 kokku)/mets1/Node2D", $"Spawns (11 kokku)/peenar1/Node2D", $"Spawns (11 kokku)/koobas2/Node2D", $"Spawns (11 kokku)/koobas1/Node2D", $"Spawns (11 kokku)/maja2/Node2D", $"Spawns (11 kokku)/maja1/Node2D", $"Spawns (11 kokku)/küngas1/Node2D", $"Spawns (11 kokku)/järv2/Node2D", $"Spawns (11 kokku)/järv1/Node2D", $"Spawns (11 kokku)/peenar2/Node2D", $"Spawns (11 kokku)/küngas2/Node2D"]
var spawnsTextures = []

func getTextures():
	for i in range(ItemManager.items_dict.size()):
		if ItemManager.items_dict[i].default:
			print("get ignored")
		else:
			textures.append(ItemManager.items_dict[i].texture)

func _ready():
	getTextures()
	for i in range(spawns.size()):
		var randomnessFactor = (randi() % textures.size() - 1)
		if textures[randomnessFactor] in spawnsTextures:
			print("olemas, ignon")
		else:
			spawns[i].icon = textures[randomnessFactor]
			spawnsTextures.append(textures[randomnessFactor])
	add_signal($"Spawns (11 kokku)")

func add_signal(node:Node):
	for el in node.get_children():
		if(el is Button):
			el.pressed.connect(func(): el.visible = not el.visible)
			# inventory
		else:
			add_signal(el)
