# LaserShip.gd

extends "res://scripts/laser.gd"

func _ready():
    connect("area_entered", self, "_on_area_enter")
    pass

func _on_area_enter(other):
    if other.is_in_group("enemy"):
        other.armor -= 1
        queue_free()
    pass