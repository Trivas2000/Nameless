extends RigidBody2D

var is_picked=false;
var origin_position=Vector2(-391, -1846)

var picked_by;
var cont=200
#onready var pos_player = get_node("../../players/player/Position2D").global_position;



func _ready():
	#print(position)
	add_to_group("objects_pickeable")

#Al usarse debe mostrar en pantalla un mensaje
func use(): 
	picked_by.can_teletransport(2)  
	
func reaparecer():
	while cont>0:
		cont= cont-1
	position = origin_position
