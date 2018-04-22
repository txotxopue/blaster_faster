# HUD/Score.gd

extends TextureRect

var score = 0 setget set_score

func _ready():
    pass

func set_score(new_value):
    score = new_value
    $Label.set_text(str(score))
    
    if score > Game.best_score:
        Game.best_score = score
    pass