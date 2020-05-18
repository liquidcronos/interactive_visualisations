extends Node2D

var move_speed   = 100
var max_acc      = 10000
var ang_vel      = 0
var acceleration = Vector2()
var velocity     = Vector2()
var forces       = Vector2()
var steer_force  = 50.0

func _process(delta):
	acceleration[0] = 0
	acceleration[1] = 0
	velocity[0] = 0
	velocity[1] = 0
	var luke_pos= get_node("/root/Floor Simulation/Luke").position
	var rel_posi=calc_relative_pos(luke_pos)
	var mode    = get_node("/root/Floor Simulation/OptionButton").selected
	get_node("/root/Floor Simulation/R2D2/Node2D/Label2").set_text(str(position/100 )+ " ("+str(rotation)+")")
	get_node("/root/Floor Simulation/VBoxContainer/HBoxContainer/dist").set_text(str(rel_posi[0]/100 ))
	get_node("/root/Floor Simulation/VBoxContainer/HBoxContainer2/wink").set_text(str(rel_posi[1] ))
	

	if mode == 1:
		acceleration += process_collision_force(luke_pos) 
	if mode == 2:
		acceleration += process_follow_force(luke_pos)
	if mode == 3:
		acceleration += process_homing(luke_pos)
	get_node("/root/Floor Simulation/VBoxContainer/HBoxContainer3/wink").set_text(str(sqrt(pow(acceleration[0],2)+pow(acceleration[1],2)) ))
	acceleration  = acceleration.clamped(max_acc)
	velocity     += acceleration * delta
	velocity      = velocity.clamped(move_speed)
	if velocity != Vector2(0,0):
		rotation = velocity.angle()
	translate(velocity*delta)



func process_collision_force(master_position):
	var connection_vector = master_position-position
	var distance = sqrt(pow(connection_vector[0],2)+pow(connection_vector[1],2))
	if distance <= 100:
		return -10000.0/distance*connection_vector.normalized() * move_speed
	else:
		return Vector2(0,0)

func process_follow_force(master_position):
	var connection_vector = master_position-position
	var distance = sqrt(pow(connection_vector[0],2)+pow(connection_vector[1],2))
	var sig = 100
	return -100000000*(pow(sig/distance,12)-pow(sig/distance,6))*connection_vector.normalized() * move_speed

func process_forward_force(master_position):
	var connection_vector = master_position-position
	var master_state = calc_relative_pos(master_position)
	var cardioid     = 2*10*(1-cos(master_state[1])+1)
	if master_state[0] <= 100:
		return  100.0*pow(cardioid,3)/master_state[0]*connection_vector.normalized() * move_speed
	else:
		return Vector2(0,0)

func process_homing(master_position):
	var rel_pose = calc_relative_pos(master_position)
	rel_pose[1]=1.2*rel_pose[1]
	var output =polar2cartesian(rel_pose[0],rel_pose[1]).rotated(rotation)
	return output	

func calc_relative_pos(target_pos):
	var connection_vector=(target_pos-position).rotated(-rotation)
	var rel_pos=cartesian2polar(connection_vector[0],connection_vector[1])
	return rel_pos

func _ready():
	pass # Replace with function body.


