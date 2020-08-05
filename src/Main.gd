extends Node2D

var spawn_time = 10;
var game_time = 0
var spawned = 0;
export (PackedScene) var Book;

func _process(_delta):
	game_time += 1
	spawn_time -= 1
	if spawn_time <= 0 && spawned < 15:
		spawn_book();
		spawn_time = max(80, 500 - (0.2 * game_time));
		print(spawn_time);

func spawn_book():
	spawned += 1;
	var enemy = Book.instance();

	var window_size = get_viewport_rect().size;
	var y = randf() * (window_size.y / 15) + (window_size.y / 10);
	enemy.translate(window_size - Vector2(0, y));
	enemy.add_to_group('enemies');

	add_child(enemy);
	
