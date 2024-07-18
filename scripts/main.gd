extends Node2D

@onready var pre_enemy = preload("res://prefabs/enemy.tscn")
@onready var spawnPoints = []
var spawnCount = 15

func _ready():
	for node in get_children():
		if node is Marker2D:
			spawnPoints.append(node)

func get_enemies():
	var randNumber = randi() % spawnPoints.size()
	var enemy = pre_enemy.instantiate()
	add_child(enemy)
	enemy.position = spawnPoints[randNumber].global_position

func spawn_enemies():
	if spawnCount > 0:
		spawnCount -= 1
		get_enemies()

func _on_spawn_timer_timeout():
		var rand_number = randi() % 100
		if rand_number > 50:
			spawn_enemies()
