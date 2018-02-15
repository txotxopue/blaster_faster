# Spawner_Enemy.gd

extends Node

const enemy_kamikaze = preload("res://scenes/Enemy_Kamikaze.tscn")

func _ready():
	spawn()
	pass

func spawn():
	while true:
		randomize() # changes random seed.
		var enemy = enemy_kamikaze.instance()
		var pos = Vector2()
		pos.x = rand_range(0 + 16, Utils.view_size.x - 16)
		pos.y = 0 - 16
		enemy.position = pos
		$Container.add_child(enemy)
		yield(Utils.create_timer(rand_range(0.5, 1.25)), "timeout")
	pass
