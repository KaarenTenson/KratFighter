extends Node2D

@onready var itemTextures = {"ämber": "res://assets/drive-download-20250125T091820Z-001/amber.png",
 "armor": "res://assets/drive-download-20250125T091820Z-001/armor.png",
 "axe": "res://assets/drive-download-20250125T091820Z-001/axe.png",
 "hat": "res://assets/drive-download-20250125T091820Z-001/hat.png",
 "kivi": "res://assets/drive-download-20250125T091820Z-001/kivi.png",
 "vikat": "res://assets/drive-download-20250125T091820Z-001/kosa.png",
 "kott": "res://assets/drive-download-20250125T091820Z-001/meshok.png",
 "mõõk": "res://assets/drive-download-20250125T091820Z-001/mook.png",
 "pitchfork": "res://assets/drive-download-20250125T091820Z-001/pitchfork.png",
 "plough": "res://assets/drive-download-20250125T091820Z-001/plug.png",
 "pot": "res://assets/drive-download-20250125T091820Z-001/pot.png",
 "shirt": "res://assets/drive-download-20250125T091820Z-001/shirt2.png",
 "hoe": "res://assets/drive-download-20250125T091820Z-001/smth.png",
 "stick": "res://assets/drive-download-20250125T091820Z-001/stiik.png",
 "millstone": "res://assets/drive-download-20250125T091820Z-001/stone.png",
 "tõllupea": "res://assets/drive-download-20250125T091820Z-001/suur-t]ll.png",
 "saba" :"res://assets/drive-download-20250125T091820Z-001/tail.png",
 "kuju": "res://assets/drive-download-20250125T091820Z-001/totem.png"
}

@onready var metsaSpawns = [ItemManager.ITEMS.AMBER, ItemManager.ITEMS.AXE]

func _ready():
	$"Spawns (11 kokku)/järv2/Sprite2D".texture = ItemManager.items_dict[ItemManager.ITEMS.SWORD].texture
