extends Control

var rng = RandomNumberGenerator.new()

onready var BGC = get_node("Track/CCC")
onready var SCORE = get_node("Track")

func _ready():
	rng.randomize()
	var randint = rng.randi_range(1,20)
	SCORE.set_text(str(randint))

func _on_Button_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf())
	var num = int(SCORE.get_text()) + 1
	SCORE.set_text(str(num))

func _on_Button2_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf())
	var num = int(SCORE.get_text()) + 2
	SCORE.set_text(str(num))

func _on_Button3_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf())
	var num = int(SCORE.get_text()) + 3
	SCORE.set_text(str(num))

func _process(_delta):
	if int(SCORE.text) >= 30:
		BGC.hide()
		SCORE.hide()
