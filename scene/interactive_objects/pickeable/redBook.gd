extends RigidBody2D

var is_picked=false;


#onready var pos_player = get_node("../../players/player/Position2D").global_position;



func _ready():
	add_to_group("objects_pickeable")

#Al usarse debe mostrar en pantalla un mensaje
func use():
	pass
