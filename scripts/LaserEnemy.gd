# LaserEnemy.gd

extends "res://scripts/laser.gd"

func _ready():
    connect("area_entered", self, "_on_area_enter")
    AudioPlayer.play(AudioPlayer.as_laser_enemy)
    pass

func _on_area_enter(other):
    if other.is_in_group("ship"):
        other.armor -= 1
        create_flare()
        Utils.remote_call("Camera", "shake", 3, 0.13)
        queue_free()
    pass