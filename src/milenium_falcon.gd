extends KinematicBody2D


const speed=200
var velocity = Vector2()
var motion = Vector2()

func _physics_process(delta):
    look_at(get_global_mouse_position())
    velocity = Vector2()
    var move = int(Input.is_action_pressed('ui_up'))
    velocity = Vector2(speed*move, 0).rotated(rotation)
	
    motion = move_and_slide(velocity)
	
    pass
