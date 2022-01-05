extends Control

var rng = RandomNumberGenerator.new()

onready var ROCK = get_node("Rocks")
onready var BGC = get_node("Track/CCC")
onready var SCORE = get_node("Track")
onready var BTNS = [get_node("Button1"), 
					get_node("Button2"),
					get_node("Button3")] # Кнопки помещены в список, чтобы
										 # их легче было перебирать все сразу 
										
onready var MAIN_MENU = get_node("StartButton")

onready var TURN = get_node("Turn") # Узел ходов
var turn_num = 1					# Счётчик ходов

func _ready(): # Загрузка игры
	rng.randomize()	# Обновляем наш рандомайзер (иначе одно и то же выдаёт)
	var randint = rng.randi_range(1,20)
	SCORE.set_text(str(randint)) # Главный счётчик игры (куча камней)

func _on_Button_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf(),0.5)
	var num = int(SCORE.get_text()) + int(BTNS[1-1].get_text()[1])
	SCORE.set_text(str(num)) # Обновляем кучу на значение btn
	turn_num+=1 # Для каждой кнопки, чтобы считать кто ходит

func _on_Button2_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf(),0.5)
	var num = int(SCORE.get_text()) + int(BTNS[2-1].get_text()[1])
	SCORE.set_text(str(num))
	turn_num+=1
	
func _on_Button3_pressed():
	BGC.color = Color(rng.randf(), rng.randf(), rng.randf(),0.5)
	var num = int(SCORE.get_text()) + int(BTNS[3-1].get_text()[1])
	SCORE.set_text(str(num))
	turn_num+=1
	

func _process(_delta): # Функция real-time, вызывается каждый frame
	if turn_num % 2 != 0:         # Чётные - Ваня, Нечёт - Петя
		TURN.text = "Petya's Turn"
	else:
		TURN.text = "Vanya's Turn"	
	
	if int(SCORE.text) >= 30:     # Если >= 30 игра завершается
		BGC.hide()
		SCORE.hide()
		ROCK.hide()
		
		for i in range(len(BTNS)): # Закрываем также все кнопки
			BTNS[i].hide()
			
		if TURN.text == "Petya's Turn":   # Так как "выйгрышное" нажатие триггерит
			TURN.text = "Vanya WINS"      # смену хода => у нас обратная зависимость
		else:
			TURN.text = "Petya WINS"
			
		MAIN_MENU.show()
	
		
		
		
		

