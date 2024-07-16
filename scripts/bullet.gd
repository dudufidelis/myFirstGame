extends CharacterBody2D

const speed = 500

func _physics_process(delta):
	velocity = Vector2(0, -speed)
	move_and_slide()

func _on_notifier_screen_exited():
	queue_free()

#Tocar no inimigo o disparo some
func _on_area_2d_body_entered(body):
	if body.is_in_group("enemies"):
		queue_free()
