class_name button_door
extends StaticBody2D
onready var detector = $detector


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("players"):
			self.set_scale(Vector2(-1,1))
			Game.door_first_level = true
			body.maxlives = 5
			body.lives= body.maxlives
			body.update_life(body.inputindex)
			
		
		
