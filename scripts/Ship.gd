# Ship.gd

extends Area2D

const scn_laser = preload("res://scenes/LaserShip.tscn")


func _ready():
    yield(Utils.create_timer(0.5), "timeout")
    shoot()
    pass


func _process(delta):
    # Tracking mouse.
    var motion = (get_global_mouse_position().x - position.x) * 0.2
    translate(Vector2(motion, 0))

    # Clamping to view.
    var pos = position
    pos.x = clamp(pos.x, 0 + 16, Utils.view_size.x - 16)
    position = pos
    pass


func shoot():
    while true:
        var pos_left = $Cannons/Left.global_position
        var pos_right = $Cannons/Right.global_position
        create_laser(pos_left)
        create_laser(pos_right)
        
        yield(Utils.create_timer(0.25), "timeout")
    pass


func create_laser(pos):
    var laser = scn_laser.instance()
    laser.position = pos
    Utils.main_node.add_child(laser)
    pass
