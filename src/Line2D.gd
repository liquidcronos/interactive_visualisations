extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_point_position(0,Vector2(0,0))
	add_point(Vector2(0,0),1)
	add_point(Vector2(0,0),2)
	add_point(Vector2(0,0),3)
	add_point(Vector2(0,0),3)

func _process(delta):
	print(get_point_count())
	var luke_pos = get_node("/root/Floor Simulation/Luke").position
	var r2d2_pos = get_node("/root/Floor Simulation/R2D2").position
	set_point_position(1,r2d2_pos)
	set_point_position(2,luke_pos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
