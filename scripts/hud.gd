extends Control

@onready var life_points = $MarginContainer/life_container/life_points
@onready var score_points = $MarginContainer/score_container/score_points

func _ready():
	life_points.text = str(Globals.life)
	score_points.text = str("%04d" % Globals.score)
	
func _process(delta):
	life_points.text = str(Globals.life)
	score_points.text = str("%04d" % Globals.score)
