class_name Hammer
extends Area2D



onready var anim_player= $AnimationPlayer 

var is_picked=false;
onready var damage_area= $Pivot/damage_detector
 
func _ready():
	pass#anim_tree.active=true
 

#add an action to this object
func use():
	if is_picked == true:
		anim_player.play("golpe")
		anim_player.seek(0, true)
		print("Usando martillo") 
		
func get_detector():
	return damage_area
