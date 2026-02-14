extends Button

func _pressed() -> void:
	if !multiplayer.is_server():
		return
	print(ServerStorage.dict_usernames)
