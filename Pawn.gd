extends Node2D


const Utils = preload("res://utils.gd")

signal showstats
signal updatehealth
signal get_attack

# party slot / class / name

export (Utils.PARTY_SLOT) var party_slot
export (Utils.PAWN_CHAR) var pawn_char
export (String) var pawn_name = "Char Name"

# stats
var char_name : String
var stocks = 3
var max_health = 100
var curr_health = 100
var attack_power
var can_attack = true

func _load_stats():
	char_name = Utils.get_char_name(pawn_char)
	max_health = Utils.get_char_health(pawn_char)
	curr_health = max_health
	attack_power = Utils.get_char_attack(pawn_char)
	
func _ready():
	_load_stats()
	display_pawn_stats()
	_get_attack()
	
func display_pawn_stats():
	emit_signal("showstats", pawn_name, char_name, max_health, curr_health, attack_power)
	
func _get_attack():
	emit_signal("get_attack", attack_power)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FightRoom_mc_attack_enemy(damage: int):
	var new_health = curr_health - damage
	curr_health = max(0, new_health)
	emit_signal("updatehealth", curr_health)


func _on_FightRoom_enemy_attack_mc(damage: int):
	var new_health = curr_health - damage
	curr_health = max(0, new_health)
	emit_signal("updatehealth", curr_health)
