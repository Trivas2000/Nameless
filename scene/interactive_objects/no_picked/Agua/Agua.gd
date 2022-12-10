extends StaticBody2D
onready var detector = $Detector

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func use():
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("players"):
			body.burning()
