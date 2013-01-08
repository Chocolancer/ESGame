package mechanics 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Weapon 
	{
		private var minAttack: uint;
		private var maxAttack: uint;
		
		public function Weapon(min: uint, max: uint) 
		{
			this.minAttack = min;
			this.maxAttack = max;
		}
		
		public function getDamage(): uint {
			var damage: uint = minAttack + Math.floor(Math.random() * this.maxAttack);
			if (damage > this.maxAttack) {
				damage = this.maxAttack;
			}
			
			return damage;
		}
		
	}

}