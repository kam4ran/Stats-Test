extends Resource

class_name CharacterStats

signal health_changed(newhealth)

export var maxhealth: int = 1 setget set_max_health, _get_max_health
var health: int = 1 setget set_health, _get_health
export var strength: int = 1 setget , _get_strength
export var defense: int = 1 setget , _get_defense
export var speed: int = 1 setget , _get_speed

func reset():
	health = self.max_health

func copy() -> CharacterStats:
	var copy = duplicate()
	copy.health = health
	return copy
	
func set_max_health(value: int):
	if value == null:
		return
	maxhealth = max(1, value)
	
func set_health(value: int):
	if value == null:
		return
	health = self.maxhealth
	
func _get_health() -> int:
	return health
	
func _get_max_health() -> int:
	return maxhealth
	
func _get_strength() -> int:
	return strength
	
func _get_defense() -> int:
	return defense
	
func _get_speed() -> int:
	return speed
	
func take_damage(hit: int):
	print("damage taken")
	health -= hit
	health = max(0, health)
	print(health)
#	emit_signal("health_changed", health)
