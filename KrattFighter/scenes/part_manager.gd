extends Node
signal death
@export var head:BodyPart 
@export var chest:BodyPart 
@export var left_hand:BodyPart
@export var right_hand: BodyPart
@export var left_leg:BodyPart
@export var right_leg:BodyPart

var part_death_count:=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	head.part_dead.connect(func(): death.emit())
	chest.part_dead.connect(func(): death.emit())
	left_hand.part_dead.connect(limb_dead)
	right_hand.part_dead.connect(limb_dead)
	left_leg.part_dead.connect(limb_dead)
	right_leg.part_dead.connect(limb_dead)
	
func limb_dead():
	part_death_count+=1
	if(part_death_count==4):
		death.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
