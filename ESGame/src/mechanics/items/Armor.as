package mechanics.items 
{
	import mechanics.battle.Element;
	import globals.Elements;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Armor extends Equipment
	{
		private var _defense: uint;
		
		public function Armor(name: String, desc: String, def: uint, element: String = Elements.NONE, elementMultiplier: uint = 1) 
		{
			super(name, desc, element, elementMultiplier);
			this._defense = def;
		}
		
		public function getPhysicalDefense(): uint {
			return this._defense;
		}
		
		public function getElementalDefense(): uint {
			return this._defense * this._element.multiplier;
		}
	}

}