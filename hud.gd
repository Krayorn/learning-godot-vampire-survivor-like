extends CanvasLayer

var gold := 0

func _ready() -> void:
	set_gold(gold)

func set_gold(amount):
	$Gold.text = "Gold: " + str(amount)

func gain_gold(amount_earned):
	gold += amount_earned
	set_gold(gold)
