extends CharacterBody2D

const speed = 300.0
var score = 150
var life = 5
var direction = 1
var load_bullet = preload("res://prefabs/bullet.tscn")
@onready var bulletPos = $Marker2D


func _physics_process(delta):
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	shoot_randomly()
	


	
func shoot_randomly():
	var test = 3
	if test > 0:
		var bullet = load_bullet.instantiate()
		get_parent().add_child(bullet)
		bullet.position = bulletPos.global_position
		test -= 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("player_bullet"):
		life -=1
		if life == 0:
			Globals.score += score
			queue_free()

	if body.is_in_group("screen_limit"):
		print("chegou no limit")
		if direction == 1:
			direction *= -1
		else:
			direction *= -1
