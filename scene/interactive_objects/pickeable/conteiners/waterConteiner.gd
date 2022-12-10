extends RigidBody2D
onready var detector = $Detector

var used=false

var is_picked=false;
var picked_by=null
#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	add_to_group("objects_pickeable")

#add an action to this object
func use():
	for body in detector.get_overlapping_areas():
			if body.is_in_group("lava") and used==false:
				body.get_parent().apagandose()
				used = true
				visible=false
				
				
				#debo cambiar contenedor por uno vacio

