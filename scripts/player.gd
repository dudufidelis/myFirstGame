extends CharacterBody2D

var speed = 500
var gravity = 1000
var load_bullet = preload("res://prefabs/bullet.tscn")

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
	var bullet = load_bullet.instantiate()
	get_parent().add_child(bullet)
	print("shooted")
	bullet.position = $Marker.global_position

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
