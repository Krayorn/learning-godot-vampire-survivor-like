extends CanvasLayer

var gold := 75

func _ready() -> void:
	set_gold(gold)

func set_gold(amount):
	$Gold.text = "Gold: " + str(amount)

func gain_gold(amount_earned):
	gold += amount_earned
	set_gold(gold)

func spend_gold(amount_spent):
	gold -= amount_spent
	set_gold(gold)
