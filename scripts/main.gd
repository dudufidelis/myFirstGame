extends Node2D

@onready var pre_enemy = preload("res://prefabs/enemy.tscn")
@onready var spawn_point_1 = $spawnPoint1.global_position
@onready var spawn_point_2 = $spawnPoint2.global_position
@onready var spawn_point_3 = $spawnPoint3.global_position
@onready var spawn_point_4 = $spawnPoint4.global_position
@onready var spawnPoints = [spawn_point_1, spawn_point_2, spawn_point_3, spawn_point_4]
var spawnCount = 15

func _ready():
	pass

func _process(delta):
	pass

func get_enemies():
	var randNumber = randi() % spawnPoints.size()
	var enemy = pre_enemy.instantiate()
	add_child(enemy)
	enemy.position = spawnPoints[randNumber]
	
func spawn_enemies():
	if spawnCount > 0:
		spawnCount -= 1
		get_enemies()

func _on_spawn_timer_timeout():
		var rand_number = randi() % 100
		if rand_number > 50:
			spawn_enemies()
