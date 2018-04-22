# SpawnerPowerUp.gd

extends Node

const powerups = [
    preload("res://scenes/PowerUpArmor.tscn"),
    preload("res://scenes/PowerUpLaser.tscn"),
]

func _ready():
    yield(Utils.create_timer(rand_range(10, 15)), "timeout")
    spawn()
    pass

func spawn():
	while true:
		randomize() # changes random seed.
		var enemy = Utils.choose(powerups).instance()
		var pos = Vector2()
		pos.x = rand_range(0 + 7, Utils.view_size.x - 16)
		pos.y = 0 - 16
		enemy.position = pos
		$Container.add_child(enemy)
		yield(Utils.create_timer(rand_range(10, 15)), "timeout")
	pass
