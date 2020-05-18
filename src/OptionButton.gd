extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item ( "bleibe Stehen", 0 )
	add_item ( "Vermeide Kollisionen", 1 )
	add_item ( "Folge Luke", 2 )
	add_item ( "Fahre zu Luke", 3 )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
