extends Node2D

#onready var boid_scene = preload("res://src/Stormtropper.tscn")
#onready var boids_container = $Stormtrooper

#var boids = []
#const BOIDS_COUNT = 20

func _ready():
	get_node("Button").connect("pressed",self,"_on_Button_pressed")
	
#	for i in BOIDS_COUNT:
#		var boid = boid_scene.instance()
#		boids_container.add_child(boid)
#		boids.push_back(boid)
		

	
	pass
func _on_Button_pressed():
	get_tree().change_scene("res://src/Simulation.tscn")
