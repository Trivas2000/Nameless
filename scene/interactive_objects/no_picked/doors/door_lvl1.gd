extends StaticBody2D


onready var anim_player= $AnimationPlayer

onready var detector = $Detector

var open = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_player.play("close")


func _physics_process(delta):
	if (open == false):
		for body in detector.get_overlapping_areas():
			if body.name == "Detector__dor_1":
				print("llave en el área")
				anim_player.play("open")
				open = true
				$CollisionShape2D.disabled = true
