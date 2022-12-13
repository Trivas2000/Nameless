extends Area2D

var active = false
var true_men = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, '_on_body_entered')
	connect("body_exited", self, '_on_body_exited')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$door_close.visible = active
	$door_open.visible = true_men
	

func _on_body_entered(body):
	if body.name == 'player'or body.name == 'player2':
		active = true
		if Game.door_first_level == true:
			true_men = true
			active = false
	
func _on_body_exited(body):
	if body.name == 'player'or body.name == 'player2':
		active = false
		if Game.door_first_level == true:
			true_men = true
			active = false
	
