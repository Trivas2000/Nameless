extends RigidBody2D

signal chest_opened
var  keytaken = false
var in_chest_zone = false

var is_picked=false;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	add_to_group("objects_pickeable")


#add an action to this object
func use():
	print("Apreto la llave")

