extends StaticBody2D


var broken=false;
onready var detector = $Detector
 
func _ready():
	add_to_group("objects_destroyables")
	 



func _physics_process(delta):
	is_destroyed()
	

#add an action to this object
func is_destroyed():
	for body in detector.get_overlapping_areas():
		if body.is_in_group("objets_to_destroy") and broken == false:
			self.queue_free()
			broken = true
