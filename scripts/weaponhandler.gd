extends Area2D
var currentweapon : Swordtype
var healing : int
var damage_multiplier : float
var speed : float
var coins : int
@onready var player: CharacterBody2D = $".."
var woodensword := preload("res://scenes/sword.tscn")


func handleitem(item : Itemtype):
	
	if item is Swordtype:
		currentweapon = item
		
		# checks type of sword to find which one to equip
		match currentweapon.weapontype:
			Swordtype.Weapontype.WOOD:
				player.swordequip(woodensword)
			Swordtype.Weapontype.IRON:
				pass
			Swordtype.Weapontype.SILVER:
				pass
			Swordtype.Weapontype.TIN:
				pass
			Swordtype.Weapontype.MITHRIL:
				pass
				
	elif item is Potiontype:
		healing += item.heal
		speed += item.speed
		damage_multiplier += item.damage
		
		print("healing rate: ",healing,
		"\n",
		"speed: ",speed,
		"\n",
		"damage mult: ", damage_multiplier)
		
	elif item is Cointype:
		coins += 1
		print(coins)
	else:
		pass
