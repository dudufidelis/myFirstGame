extends CharacterBody2D

const speed = 500

func _physics_process(delta):
	velocity = Vector2(0, -speed)
	move_and_slide()

func _on_notifier_screen_exited():
	queue_free()
