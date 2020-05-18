extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var r2d2_acc = get_node("/root/Floor Simulation/R2D2").acceleration
	var acc_value=sqrt(pow(r2d2_acc[0],2)+pow(r2d2_acc[1],2))
	print(acc_value)
	value = acc_value/10000*100
