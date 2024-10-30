extends Node2D

# URL для подключения
var websocket_url: String
# Экземпляр WebSocketPeer
var socket: WebSocketPeer

func _ready() -> void:
	socket = WebSocketPeer.new()

func _on_button_5_pressed() -> void:
	websocket_url = $LineEdit.get_text()
	Input.vibrate_handheld(15)

	# Инициация подключения к указанному URL
	var err = socket.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		set_process(false)
		return

	# Начинаем процесс обработки
	set_process(true)

func _process(delta: float) -> void:
	# Обрабатываем события WebSocket
	socket.poll()

	# Получаем состояние соединения
	var state = socket.get_ready_state()

	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count() > 0:
			var message = socket.get_packet().get_string_from_utf8()
			print("Got data from server: ", message)

	elif state == WebSocketPeer.STATE_CLOSING:
		pass  # Можно добавить обработку закрытия

	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		print("WebSocket closed with code: %d. Clean: %s" % [code, code != -1])
		set_process(false)  # Останавливаем обработку

func _on_button_3_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("up")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("left")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_2_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("right")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_4_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("down")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_6_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("a")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_9_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("x")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_7_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("y")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_8_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("b")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_12_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("select")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_13_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("start")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_10_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("lt")
	else:
		print("WebSocket is not open. Cannot send message.")


func _on_button_11_pressed() -> void:
	Input.vibrate_handheld(15)
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		socket.send_text("rt")
	else:
		print("WebSocket is not open. Cannot send message.")
