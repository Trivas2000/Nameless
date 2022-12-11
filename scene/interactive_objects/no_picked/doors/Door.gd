extends StaticBody2D


onready var anim_player= $AnimationPlayer3
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var detector = $Detector

var open = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_tree.active=true


func _physics_process(delta):
	if (open == false):
		for body in detector.get_overlapping_areas():
			print("buscando en area")
			if body.is_in_group("key_1"):
				print("llave en el área")
				playback.travel("open")
				open = true
				$CollisionShape2D.disabled = true
	else:
		var key=false;
		for body in detector.get_overlapping_areas():
			if body.is_in_group("key_1"):
				playback.travel("stay_open")
				#open = true
				key=true
		#si la llave sale del área, se cierra
		if key==false:
			pass
			#playback.travel("close")
