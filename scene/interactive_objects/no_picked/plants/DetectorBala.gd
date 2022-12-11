extends Area2D

 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass  



func _process(delta):
	for body in self.get_overlapping_areas():
		if body.is_in_group("bullet"):
			body.queue_free()

	
