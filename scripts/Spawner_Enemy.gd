# Spawner_Enemy.gd

extends Node

const enemy_kamikaze = preload("res://scenes/Enemy_Kamikaze.tscn")

func _ready():
	spawn()
	pass

func spawn():
	randomize() # changes random seed.
	var enemy = enemy_kamikaze.instance()
	var pos = Vector2()
	pos.x = rand_range(0 + 16, get_viewport().get_visible_rect().size.x - 16)
	pos.y = 0 - 16
	enemy.position = pos
	$Container.add_child(enemy)
	pass
