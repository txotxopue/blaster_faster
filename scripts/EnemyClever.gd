# EnemyClever.gd

extends "res://scripts/Enemy.gd"

const scn_laser = preload("res://scenes/LaserEnemy.tscn")

func _ready():
    velocity.x = Utils.choose([velocity.x, -velocity.x])
    
    yield(Utils.create_timer(1), "timeout")
    shoot()
    pass

# Will execute this process first, and then the process of the function that we are extending. ??
func _process(delta):
    # Bouncing on the edges.
    if position.x <= 0+16:
        velocity.x = abs(velocity.x)
    if position.x >= Utils.view_size.x-16:
        velocity.x = -abs(velocity.x)
    pass


func shoot():
    while true:
        var laser = scn_laser.instance()
        laser.position = $Cannon.global_position
        Utils.main_node.add_child(laser)
        yield(Utils.create_timer(1.5), "timeout")
    pass