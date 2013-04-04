package globals 
{
	import mechanics.items.*;
	import globals.Elements;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class EquipmentCollection 
	{
		public static var weaponCollection: Object = new Object();
		public static var armorCollection: Object = new Object(); //includes not just panels but textboxes as well
		public static var accessoryCollection: Object = new Object();
		public static var itemCollection: Object = new Object();
		
		public static function load(): void
		{
			//UNARMED
			weaponCollection.Unarmed = new Weapon("Unarmed", "", 5, 5);
			armorCollection.Unarmed = new Armor("None", "", 1);
			
			//WEAPONS
			//Cletus
			weaponCollection.Orichalcon = new Weapon("Orichalcon", "A long-handled weapon made of an otherworldly alloy impervious to rust. Not even the harbinger knows its true purpose.", 10, 15);
			weaponCollection.BGlaive = new Weapon("Blessed Glaive", "A polearm blessed with the powers of the goddess Yfadna. It was once a weapon wielded by a great hero.", 19, 27, Elements.SUN, 1.2);
			weaponCollection.OrichalconA = new Weapon("Orichalcon A", "A long-handled weapon made of an otherworldly alloy impervious to rust. It has been tempered to make it stronger.", 30, 37);
			weaponCollection.OrichalconB = new Weapon("Orichalcon B", "A long-handled weapon made of an otherworldly alloy impervious to rust. The alloy has been infused with Gantusian alloys to make it more durable.", 60, 66);
			weaponCollection.OrichalconG = new Weapon("Orichalcon G", "A long-handled weapon made of an otherworldly alloy impervious to rust. It has been tempered to full strength.", 88, 100);
			
			//Rosa
			weaponCollection.XM120 = new Weapon("XM-120", "A prototype rifle that Rosa stole from the Coven's Research Department before her exile. Its frequent use has deteriorated its former condition.", 7, 12);
			
			//Cirrus
			weaponCollection.Bleeder = new Weapon("Bleeder", "A worn greatsword tainted by the blood of many foes. It has become dull and is now only used to smash rather than cut.", 12, 16);
			
			//Zane
			weaponCollection.FuryRod = new Weapon("Fury Rod", "A mystical rod crafted by Zane himself by placing an ancient fiery artifact on top of a metal catalyst, attached to a magically-attuned wood from his continent.", 45, 51);

			
			
			//ARMOR
			armorCollection.TravellingClothes = new Armor("Travelling Clothes", "A comfortable, airy set of clothes padded with leather underneath for light protection. Covers a good amount of the body.", 5);
			armorCollection.LucidGarb = new Armor("Lucid Garb", "A leather garb enchanted with the powers of Lum. Its surface shimmers in the moonlight.", 12, Elements.MOON, 1.2);
			
			//ACCESSORIES
			
			//ITEMS
		}
		
	}

}