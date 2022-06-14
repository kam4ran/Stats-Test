extends CanvasLayer

signal mc_attack_enemy
signal enemy_attack_mc

var mc_attack: int
var e_attack: int

func _ready():
	print("initalized!!!")
	var mc = get_node("../MainChar")
	mc.connect("get_attack", self, "_get_main_attack")
	var e = get_node("../Enemy")
	e.connect("get_attack", self, "_get_enemy_attack")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Fight_pressed():
	print("Button Pressed");
	emit_signal("mc_attack_enemy", mc_attack)
	emit_signal("enemy_attack_mc", e_attack)

func _get_main_attack(atk: int):
	print("getting main attack")
	mc_attack = atk
	print("Main char attack: ", mc_attack)
	
func _get_enemy_attack(atk: int):
	e_attack = atk
	print("Enemy char attack: ", e_attack)

#func _on_health_changed(newhealth: int):
#	print("taking damage..")
#	$Health.text = str(newhealth)

func _on_MainChar_showstats(playername: String, charname: String, maxhealth: int, currhealth: int, attack: int):
	$MC_Player_Name.text = playername
	$MC_Char_Name.text = charname
	$MC_Max_Health.text = str(maxhealth)
	$MC_Curr_Health.text = str(currhealth)
	$MC_Attack.text = str(attack)


func _on_Enemy_showstats(playername: String, charname: String, maxhealth: int, currhealth: int, attack: int):
	$E_Player_Name.text = playername
	$E_Char_Name.text = charname
	$E_Max_Health.text = str(maxhealth)
	$E_Curr_Health.text = str(currhealth)
	$E_Attack.text = str(attack)


func _on_MainChar_updatehealth(newhealth):
	print("taking damage..")
	$MC_Curr_Health.text = str(newhealth)


func _on_Enemy_updatehealth(newhealth):
	print("taking damage..")
	$E_Curr_Health.text = str(newhealth)
