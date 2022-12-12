extends Control
	
func update1(live):
	$Hearts.rect_size.x = live * 20
	if(live==0.5):
		$Hearts.texture = preload("res://texturas/vidas/half1.png")
	else:
		$Hearts.texture = preload("res://texturas/vidas/heart-icon.png")

func update2(live):
	$Hearts2.rect_size.x = live * 20
	if(live==0.5):
		$Hearts2.texture = preload("res://texturas/vidas/half2.png")
	else:
		$Hearts2.texture = preload("res://texturas/vidas/heart1.png")
