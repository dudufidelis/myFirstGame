extends CharacterBody2D

var speed = 500
var gravity = 1000
var load_bullet = preload("res://prefabs/bullet.tscn")
var player_life = Globals.life
@onready var shoot_sfx = $shoot_sfx
@onready var damage_sfx = $damage_sfx

func _physics_process(delta):
	if !is_on_floor():
		velocity.y = gravity
	
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	shoot_sfx.play()
	var bullet = load_bullet.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker.global_position

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_2d_body_entered(body):
	player_life -= 1
	damage_sfx.play()
	Globals.life = player_life
	if player_life <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
