class_name Hammer
extends Area2D



onready var anim_player= $AnimationPlayer
#onready var anim_tree = $AnimationTree
#onready var playback = anim_tree.get("parameters/playback")


var is_picked=false;
onready var damage_area= $Pivot/damage_detector

#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	pass#anim_tree.active=true
 

#add an action to this object
func use():
	if is_picked == true:
		anim_player.play("golpe")
		anim_player.seek(0, true) 
		


func get_detector():
	return damage_area
	
