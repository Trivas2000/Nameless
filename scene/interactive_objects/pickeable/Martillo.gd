extends Area2D



onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")


var is_picked=false;


#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	anim_tree.active=true
 

#add an action to this object
func use():
	if is_picked == true:
		playback.travel("golpe")
		print("Usando martillo") 
		
