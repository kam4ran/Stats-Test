extends Resource

class_name DamageCalc

signal damage

export (int) var hit_damage

var current_value = 0

func reset():
	current_value = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
