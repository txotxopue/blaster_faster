# HUD/Armor.gd

extends Sprite

func _ready():
    Utils.attach("Ship", "armor_changed", self, "_on_armor_changed")
    pass

func _on_armor_changed(armor):
    set_frame(armor)
    pass