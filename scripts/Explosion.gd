# Explosion.gd

extends Sprite

func _ready():
    randomize()
    rotate(deg2rad(rand_range(0, 360)))
    
    $PSmoke.set_emitting(true)
    $PFlare.set_emitting(true)
    $AnimationPlayer.play("fade_out")
    
    yield($AnimationPlayer, "animation_finished")
    queue_free()
    
    pass
