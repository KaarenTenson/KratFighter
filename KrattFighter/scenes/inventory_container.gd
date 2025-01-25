extends GridContainer
const INVENTORY_SLOT = preload("res://scenes/InventorySlot.tscn")
var inv_instance:InventorySlot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inv_instance=INVENTORY_SLOT.instantiate()
	for item in ItemManager.current_items:
		var new_obj :=inv_instance.duplicate()
		new_obj.set_item(ItemManager.items_dict[item])
		find_empty().add_child(new_obj)

func find_empty()->Panel:
	for child in self.get_children():
		if(len(child.get_children())==0):
			return child
	return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
