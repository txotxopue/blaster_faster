# AudioPlayer.gd

extends Node

const as_laser_ship  = preload("res://sounds/laser_ship.wav")
const as_laser_enemy = preload("res://sounds/laser_enemy.wav")
const as_hit_ship    = preload("res://sounds/hit_ship.wav")
const as_hit_enemy   = preload("res://sounds/hit_enemy.wav")
const as_explosion   = preload("res://sounds/explosion.wav")
const as_powerup     = preload("res://sounds/powerup.wav")

func _ready():
    pass

func play(sample):
    var player = get_sfx_node()
    player.set_stream(sample)
    player.play()
    pass

func get_sfx_node():
    var children = $SFX.get_children()
    for child in children:
        if child.is_playing() == false:
            return child
    var new_sfx_node = AudioStreamPlayer.new()
    $SFX.add_child(new_sfx_node)
    return new_sfx_node
    pass