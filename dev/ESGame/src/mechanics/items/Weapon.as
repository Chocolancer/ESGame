package mechanics.items 
{
	import flash.text.engine.ElementFormat;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Weapon 
	{
		private var minAttack: uint;
		private var maxAttack: uint;
		//private var element: Element;
		
		public function Weapon(min: uint, max: uint) 
		{
			this.minAttack = min;
			this.maxAttack = max;
		}
		
		public function getDamage(): uint {
			return minAttack + (Math.floor(Math.random() * this.maxAttack) - minAttack);
		}
		
	}

}