# Flash.gd

extends Sprite

func _ready():
    $AnimationPlayer.play("fade_out")
    yield($AnimationPlayer, "animation_finished")
    queue_free()
    pass
