extends StaticBody2D


var recipent = preload("res://scene/interactive_objects/pickeable/conteiners/waterConteiner.tscn")
onready var detector = $Detector



var timer := Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 1.0
	timer.one_shot = true 



func _physics_process(delta):
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("players"):
			add_child(recipent.instance())
			timer.start()
			timer.connect("timeout", self, "_on_timer_timeout")



func _on_timer_timeout() -> void:
	timer.wait_time = 1.0
	timer.one_shot = true 
			
			
			
