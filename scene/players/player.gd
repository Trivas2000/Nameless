extends KinematicBody2D
export var inputindex = 1
export var texture=1
var SPEED=200
var maxlives=5
var lives
onready var timer = $Timer
var canPick = true;
onready var pick_dino =$Pivot/Pick_dino
var picked;

var canTeletransport=false;
var tel= [false,false,false]




onready var pivot= $Pivot
onready var sprite_text = $Pivot/Sprite
onready var blue_dino = preload("res://texturas/personaje/sheets/DinoSprites - doux.png")
onready var red_dino = preload("res://texturas/personaje/sheets/DinoSprites - mort.png")
onready var yellow_dino = preload("res://texturas/personaje/sheets/DinoSprites - tard.png")
onready var green_dino = preload("res://texturas/personaje/sheets/DinoSprites - vita.png")
onready var life = $"../../Life_section/Life"



onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

var debuger = true



# Called when the node enters the scene tree for the first time.
func _ready():
	lives=maxlives
	life.new(lives)
	anim_tree.active=true
	timer.set_one_shot(true)
	if(inputindex==2):
		texture=Game.texture_player_one
	
	if(inputindex==1):
		texture=Game.texture_player_two
	
	if  (texture == 1):
		sprite_text.set_texture(blue_dino)

	elif(texture == 2):
		sprite_text.set_texture(red_dino)

	elif(texture == 3):
		sprite_text.set_texture(yellow_dino)

	else:
		sprite_text.set_texture(green_dino)
		
	if debuger==true:
		canTeletransport=true
		
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	movement()
	objects()
	#Daño
	for object in $Detector.get_overlapping_areas():
		if object.is_in_group("Damage") :
			if (picked is Hammer and (picked.get_detector() == object)):
				return
			if (picked is Espada and  (picked.get_detector() == object)):
				return
			if (picked is EspadaMetal and  (picked.get_detector() == object)):
				return
			damage()	
				
	return 	
		
func movement():
	var movementp1:Vector2 = Input.get_vector("Izq"+str(inputindex),"Der"+str(inputindex),"Arriba"+str(inputindex),"Abajo"+str(inputindex))
	move_and_slide(movementp1*SPEED)
	if ((abs(movementp1.x)>0 or abs(movementp1.y)>0) and playback.get_current_node()!="hurt"):
		playback.travel("run")
	elif(playback.get_current_node()!="hurt"):
		playback.travel("idle")
	if movementp1.x<0:
		pivot.set_scale(Vector2(-0.5,0.5))
		if is_instance_valid(picked):
			if picked.is_in_group("objet_reflectable"):
				picked.set_scale(Vector2(-1,1)) 
			picked.global_position =pick_dino.global_position
	if movementp1.x>0:
		pivot.set_scale(Vector2(0.5,0.5))
		if is_instance_valid(picked):
			if picked.is_in_group("objet_reflectable"):
				picked.set_scale(Vector2(1,1))
			picked.global_position =pick_dino.global_position
			
func damage():
	if playback.get_current_node()!="hurt" and timer.get_time_left()==0:		
		print(playback.get_current_node())	
		timer.start()
		playback.travel("hurt")
		lives=lives-1
		if (lives<=0):
			restart()
		life.new(lives)	
		
func restart():
	position=Vector2(46,91)
	lives=maxlives
	playback.travel("idle")


func objects():
	if (Input.is_action_just_pressed("ui_pick"+str(inputindex))):	
		_pick_object2()			
	if (Input.is_action_just_pressed("ui_use_object"+str(inputindex))):
		_use_object()
		
func _pick_object2(): 
	if (canPick == false and is_instance_valid(picked)) :
		_pick_object(picked)
	else :
		for body in $Detector.get_overlapping_bodies():
			if body.is_in_group("objects_pickeable"):
				_pick_object(body)
				return 
		for object in $Detector.get_overlapping_areas():
			if object.is_in_group("objects_pickeable"):
				_pick_object(object)
				return 
				 
			

func _pick_object(body):
	if (canPick == false) :
		self.remove_child(picked)
		get_parent().add_child(picked)
		picked.global_position =pick_dino.global_position 
		picked = null
		canPick=true
		
	else :
		canPick = false
		body.is_picked = true
		picked = body #Black_book.instance()
		body.get_parent().remove_child(body)
		picked = body
		if body.is_in_group("restituible") or body.is_in_group("picked_by"):
			picked.picked_by = self;
		
		self.add_child(picked)
		picked.is_picked = true
		picked.global_position =pick_dino.global_position 
		

func _use_object():
	#Si tiene algo tomado
	if (canPick == false):	
		picked.use()
		if picked.is_in_group("restituible") or picked.is_in_group("picked_by"):
			_pick_object(picked)
	#Si no tiene nada tomado, revisa si hay un objeto no pickeable

	for body in $Detector.get_overlapping_bodies():
			if body.is_in_group("objects_not_pickeable"):
				body.use()
		

func can_teletransport(indice):
	tel[indice] = true;
	if tel[0]==true and (tel[1]== true and tel[2]==true):
		canTeletransport=true
		return true
	else:
		return false
		
		
func check_is_dead():
	if (lives<=0):
		position=Vector2(46,91)
		lives=100
		
		
func burning(damage):
	playback.travel("hurt")
	lives = lives-damage
	check_is_dead()
	
	
	
	


func _on_explotion_area_entered(area):
	get_parent().get_node("explotion/AnimationPlayer").play("explotion")


func _on_explotion2_area_entered(area):
	get_parent().get_node("explotion2/AnimationPlayer").play("explotion")
	damage()


func _on_explotion3_area_entered(area):
	get_parent().get_node("explotion3/AnimationPlayer").play("explotion")
	damage()


func _on_explotion4_area_entered(area):
	get_parent().get_node("explotion4/AnimationPlayer").play("explotion")
	damage()


func _on_explotion5_area_entered(area):
	get_parent().get_node("explotion5/AnimationPlayer").play("explotion")
	damage()

func _on_explotion6_area_entered(area):
	get_parent().get_node("explotion6/AnimationPlayer").play("explotion")
	damage()
