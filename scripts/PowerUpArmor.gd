# PowerUpArmor.gd

extends "res://scripts/PowerUp.gd"

func _ready():
    connect("area_entered", self, "_on_area_entered")
    pass
    
func _on_area_entered(other):
    if other.is_in_group("ship"):
        other.armor += 1
        AudioPlayer.play(AudioPlayer.as_powerup)
        queue_free()
    pass
