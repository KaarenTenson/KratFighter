extends Node2D
@onready var textures = []
@onready var itemIndexes = []
@onready var inventory = []
@onready var spawns = [$"Spawns (11 kokku)/mets1/Node2D", $"Spawns (11 kokku)/peenar1/Node2D", $"Spawns (11 kokku)/koobas2/Node2D", $"Spawns (11 kokku)/koobas1/Node2D", $"Spawns (11 kokku)/maja2/Node2D", $"Spawns (11 kokku)/maja1/Node2D", $"Spawns (11 kokku)/küngas1/Node2D", $"Spawns (11 kokku)/järv2/Node2D", $"Spawns (11 kokku)/järv1/Node2D", $"Spawns (11 kokku)/peenar2/Node2D", $"Spawns (11 kokku)/küngas2/Node2D"]
@onready var invIcons = [$Inventory/InventoryContainer/InventoryPanel1/Node2D, $Inventory/InventoryContainer/InventoryPanel2/Node2D, $Inventory/InventoryContainer/InventoryPanel3/Node2D, $Inventory/InventoryContainer/InventoryPanel4/Node2D, $Inventory/InventoryContainer/InventoryPanel5/Node2D, $Inventory/InventoryContainer/InventoryPanel6/Node2D, $Inventory/InventoryContainer/InventoryPanel7/Node2D, $Inventory/InventoryContainer/InventoryPanel8/Node2D, $Inventory/InventoryContainer/InventoryPanel9/Node2D]
var spawnsTextures = []

func getTextures():
	for i in range(ItemManager.items_dict.size()):
		if ItemManager.items_dict[i].default:
			print("get ignored")
		else:
			textures.append(ItemManager.items_dict[i].texture)
			itemIndexes.append(ItemManager.items_dict[i].name)

func _ready():
	Musicplayer.play_music_map()
	getTextures()
	for i in range(spawns.size()):
		var randomnessFactor = (randi() % textures.size() - 1)
		if textures[randomnessFactor] in spawnsTextures:
			print("olemas, ignon")
		else:
			(spawns[i] as mapObject).set_item((itemIndexes[randomnessFactor]))
			spawns[i].icon = textures[randomnessFactor]
			spawnsTextures.append(textures[randomnessFactor])
	add_signal($"Spawns (11 kokku)")

func add_signal(node:Node):
	for el in node.get_children():
		if(el is Button):
			el.pressed.connect(func():
				if (inventory.size() < 9):
					el.visible = not el.visible
					var item :Items= ItemManager.items_dict.get(el.item)
					addItem(item)
					inventory.append(item)
					ItemManager.current_items.append(item.name)
					print(ItemManager.current_items)
				else:
					print("max slots!!")
				)
		else:
			add_signal(el)

func addItem(item):
	invIcons[inventory.size()].icon = item.texture

func _on_audio_stream_player_2d_finished() -> void:
	$SFX.play("res://assets/sfx/Birds.mp3")
