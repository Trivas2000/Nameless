extends RigidBody2D

var picked=false;
onready var player=get_node("../../players/player");
#onready var pos_player = get_node("../../players/player/Position2D").global_position;


func _physics_process(delta):
	if picked == true:
		self.position = self.position
		#self.position = pos_player

func _input(event):
	if Input.is_action_just_pressed("ui_pick1"):
		var bodies= $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name=="player" and player.canPick==true:
				picked=true;
				player.canPick=false;
				
	if Input.is_action_just_pressed("ui_drop"):
		picked=false
		player.canPick=true
		if player.sprite.flip_h == false:
			apply_impulse(Vector2(), Vector2(90,0))
		else:
			apply_impulse(Vector2(), Vector2(90,0))
			
	if Input.is_action_just_pressed("ui_throw") and picked==false:
		picked=false
		player.canPick=true
		if player.sprite.flip_h == false:
			apply_impulse(Vector2(), Vector2(100,0))
		else:
			apply_impulse(Vector2(), Vector2(100,0))
		
		
			
