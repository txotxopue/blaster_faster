# MainMenu/MenuButton.gd

extends TextureButton

func _ready():
    connect("pressed", self, "_on_pressed")
    Utils.attach("Ship", "tree_exiting", self, "_on_ship_exit_tree")
    pass

func _on_pressed():
    get_tree().change_scene("res://levels/MainMenu.tscn")
    pass
    
func _on_ship_exit_tree():
    show()
    pass