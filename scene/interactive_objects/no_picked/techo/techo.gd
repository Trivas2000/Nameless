extends StaticBody2D
onready var Detector = $Detector

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _physics_process(delta):
	visible=true	
	for object in Detector.get_overlapping_areas():
		if object.is_in_group("players"):
			visible = false
			break
		
		
			
