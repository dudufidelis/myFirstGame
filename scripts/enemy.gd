extends CharacterBody2D

const speed = 300.0
var score = 150
var life = 5
var direction = 1
var load_bullet = preload("res://prefabs/enemy_bullet.tscn")
@onready var dying_sfx = $dying_sfx

func _physics_process(delta):
	velocity.x = direction * speed
	move_and_slide()

func shoot():
	var bullet = load_bullet.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position

func randShoot():
	var rand_number = randi() % 100
	if rand_number > 50:
		shoot()
		changeDirection()

func changeDirection():
	direction *= -1

func _on_area_2d_body_entered(body):
	if body.is_in_group("player_bullet"):
		life -=1
		if life == 0:
			die()

	if body.is_in_group("screen_limit"):
		changeDirection()

func die():
	Globals.score += score
	Globals.enemies_dead += 1
	dying_sfx.play()
	queue_free()

func _on_timer_timeout():
	randShoot()

func _on_visible_on_screen_notifier_2d_screen_exited():
	die()
