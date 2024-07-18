extends Node2D

@onready var pre_enemy = preload("res://prefabs/enemy.tscn")
@onready var spawnPoints = []
var spawn_limit = 15

func _ready():
	for node in get_children():
		if node is Marker2D:
			spawnPoints.append(node)

func _physics_process(delta):
	check_enemies_dead()

func spawn_enemies():
	var rand_number = randi() % spawnPoints.size()
	var enemy = pre_enemy.instantiate()
	enemy.position = spawnPoints[rand_number].global_position
	add_child(enemy)

func check_spawn_limit():
	if spawn_limit > 0:
		spawn_limit -= 1
		spawn_enemies()

func check_enemies_dead():
	var dead = Globals.enemies_dead
	if Globals.enemies_dead == 15:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _on_spawn_timer_timeout():
		var rand_number = randi() % 100
		if rand_number > 50:
			check_spawn_limit()
