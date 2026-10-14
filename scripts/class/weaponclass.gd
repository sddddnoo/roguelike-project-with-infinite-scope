class_name Swordtype
extends Itemtype

@export var damage: int
@export var cooldown: float

enum Weapontype { WOOD, IRON, SILVER, TIN, MITHRIL }
@export var weapontype: Weapontype = Weapontype.WOOD
