extends RigidBody2D

var is_picked=false;
var origin_position=Vector2(-445, -1247)


var timer := Timer.new()

var picked_by; 


func _ready():
	#print(position)
	add_to_group("objects_pickeable")
	timer.wait_time = 3.0
	timer.one_shot = true 

#Al usarse debe mostrar en pantalla un mensaje
func use(): 
	picked_by.can_teletransport(0) 



func reaparecer():
	timer.start()
	timer.connect("timeout", self, "_on_timer_timeout")
	


func _on_timer_timeout() -> void:
	position = origin_position
	
