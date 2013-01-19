package globals 
{
	import mechanics.items.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class EquipmentCollection 
	{
		public var weaponCollection: Object = new Object();
		public var armorCollection: Object = new Object(); //includes not just panels but textboxes as well
		public var accessoryCollection: Object = new Object();
		public var itemCollection: Object = new Object();
		
		public function EquipmentCollection() 
		{
			//WEAPONS
			weaponCollection.Orichalcon = new Weapon("Orichalcon", "A long-handled weapon made of an otherworldly alloy impervious to rust. Not even the harbinger knows its true purpose.", 10, 15);
			
			//ARMOR
			armorCollection.TravellingClothes = new Armor("Travelling Clothes", "A comfortable, airy set of clothes padded with leather underneath for light protection. Covers a good amount of the body.", 5);
			
			//ACCESSORIES
			
			//ITEMS
		}
		
	}

}