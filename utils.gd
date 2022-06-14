enum PARTY_SLOT {Slot1, Slot2, Slot3, Slot4}
enum PAWN_CHAR {Fox, Marth, Jigglypuff}


static func get_party_slot(var party_slot):
	match party_slot:
		0: return 1
		1: return 2
		2: return 3
		3: return 4
		
static func get_char_health(var pawn_char):
	match pawn_char:
		0: return 70
		1: return 100
		2: return 50
		
static func get_char_attack(var pawn_char):
	match pawn_char:
		0: return 15
		1: return 10
		2: return 20

static func get_char_name(var pawn_char):
	match pawn_char:
		0: return "Fox"
		1: return "Marth"
		2: return "Jigglypuff"
