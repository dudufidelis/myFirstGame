extends CharacterBody2D

@export var speed = 600

func _physics_process(delta):
	velocity = Vector2(0, speed)
	move_and_slide()

#Tocar no inimigo o disparo some
func _on_area_2d_body_entered(body):
	if body.is_in_group("player") or body.is_in_group("ground") or body.is_in_group("player_bullet"):
		queue_free()
