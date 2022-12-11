extends RigidBody2D
onready var detector = $Detector

var used=false

var is_picked=false;
var picked_by=null
var timer := Timer.new()
var origin_position=Vector2(-1441, -190)



#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	add_child(timer)
	timer.wait_time = 2.0
	timer.one_shot = true
	add_to_group("objects_pickeable")

#add an action to this object
func use():
	for body in detector.get_overlapping_areas():
			if body.is_in_group("lava") and used==false:
				body.get_parent().apagandose()
				used = true
				visible=false
				timer.start()
				timer.connect("timeout", self, "_on_timer_timeout")



func _on_timer_timeout() -> void:
	visible=true
	position=origin_position
	
				
				
				#debo cambiar contenedor por uno vacio

