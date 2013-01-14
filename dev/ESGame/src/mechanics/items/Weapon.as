package mechanics.items 
{
	import mechanics.Element;
	import globals.Elements;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Weapon extends Equipment
	{
		private var _minAttack: uint;
		private var _maxAttack: uint;
		
		public function Weapon(name: String, min: uint, max: uint, element: String = Elements.KAS, elementMultiplier: uint = 1) 
		{
			super(name, element, elementMultiplier);
			this._minAttack = min;
			this._maxAttack = max;
		}
		
		public function getPhysicalDamage(): uint {
			return _minAttack + (Math.floor(Math.random() * this._maxAttack) - _minAttack);
		}
		
		public function getElementalDamage(): uint {
			return (_minAttack + (Math.floor(Math.random() * this._maxAttack) - _minAttack)) * _element.getElementMultiplier();
		}
	}

}