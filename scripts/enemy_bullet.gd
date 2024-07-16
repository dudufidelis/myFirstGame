extends CharacterBody2D

const speed = 500

func _physics_process(delta):
	velocity = Vector2(0, speed)
	move_and_slide()

#Tocar no inimigo o disparo some
func _on_area_2d_body_entered(body):
	if body.is_in_group("player", "ground"):
		queue_free()
