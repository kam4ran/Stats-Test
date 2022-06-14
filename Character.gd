extends Node2D

class_name Character

signal showstats
signal updatehealth

export var stats: Resource
var maxhealth : int
var health: int
var strength: int
var defense: int
var speed: int

func _ready():
	print("initalized")
	stats = stats.copy()
	maxhealth = stats._get_max_health()
	health = stats._get_health()
	strength = stats._get_strength()
	defense = stats._get_defense()
	speed = stats._get_speed()
	
#	emit_signal("showstats", stats._get_max_health(), stats._get_health(), stats._get_strength(), stats._get_defense(), stats._get_speed())
	
func _on_FightRoom_attack(hit: int):
	var damage = hit
	print("Damage dealt: ",damage)
	stats.take_damage(damage)
#	emit_signal("updatehealth", stats._get_health())
