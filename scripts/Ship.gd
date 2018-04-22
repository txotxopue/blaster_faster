# Ship.gd

extends Area2D

var armor = 4 setget set_armor
var is_double_shooting = false setget set_double_shooting

const scn_laser     = preload("res://scenes/LaserShip.tscn")
const scn_explosion = preload("res://scenes/Explosion.tscn")
const scn_flash     = preload("res://scenes/Flash.tscn")

signal armor_changed

func _ready():
    add_to_group("ship")
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
        
        if is_double_shooting:
            var laser_left  = create_laser(pos_left)
            var laser_right = create_laser(pos_right)
            laser_left.velocity.x = -25
            laser_right.velocity.x = 25
        
        yield(Utils.create_timer(0.25), "timeout")
    pass
    
func set_armor(new_value):
    if new_value > 4: return
    
    if new_value < armor:
        AudioPlayer.play(AudioPlayer.as_laser_ship)
        Utils.main_node.add_child(scn_flash.instance())
    
    armor = new_value
    emit_signal("armor_changed", armor)
    
    if armor <= 0: 
        create_explosion()
        queue_free()
    pass

func set_double_shooting(new_value):
    is_double_shooting = new_value
    
    if is_double_shooting:
        yield(Utils.create_timer(5), "timeout")
        is_double_shooting = false
    pass


func create_laser(pos):
    var laser = scn_laser.instance()
    laser.position = pos
    Utils.main_node.add_child(laser)
    return laser
    pass

func create_explosion():
    var explosion = scn_explosion.instance()
    explosion.position = position
    Utils.main_node.add_child(explosion)
    pass
