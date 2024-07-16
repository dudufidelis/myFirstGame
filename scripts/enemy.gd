extends CharacterBody2D

const speed = 300.0
var score = 150

#func _physics_process(delta):
	#var direction = 1
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
#
	#move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player_bullet"):
		Globals.score += score
		queue_free()
