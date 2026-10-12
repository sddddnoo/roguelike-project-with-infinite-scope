class_name Swordtype
extends Itemtype

@export var damage: int
@export var cooldown: float
@export var range: int

enum Weapontype { WOOD, IRON, SILVER, TIN, MITHRIL }
@export var weapontype: Weapontype = Weapontype.WOOD
