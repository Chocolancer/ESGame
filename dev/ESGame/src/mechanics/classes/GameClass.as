package mechanics.classes 
{
	import mechanics.characters.Character;
	import mechanics.characters.Enemy;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class GameClass 
	{
		protected var className: String;
		
		//base stats
		protected var baseStr: uint;
		protected var baseAgl: uint;
		protected var baseInt: uint;
		protected var baseHp: uint;
		protected var baseTp: uint;
		
		//rates; must be between 0 to 100
		protected var chanceStrIncrease: uint;
		protected var chanceAglIncrease: uint;
		protected var chanceIntIncrease: uint;
		protected var chanceHpIncrease: uint;
		protected var chanceTpIncrease: uint;
		
		public function GameClass() { }
		
		public static function getClass(clName: String): GameClass {
			switch (clName) {
				case "Soldier":
					return new Soldier();
					break;
				case "Ranger":
					return new Ranger();
					break;
				case "Assassin":
					return new Assassin();
					break;
				case "Thaumaturge":
					return new Thaumaturge();
					break;
			}
			
			return new EnemyClass();
		}
		
		public function getName(): String {
			return className;
		}
		
		public function setBaseStats(chr: Character): void {
			chr.setStrength(baseStr);
			chr.setAgility(baseAgl);
			chr.setIntelligence(baseInt);
			chr.setHp(baseHp);
			chr.setTp(baseTp);
			chr.setTpRecovery(Math.ceil(chr.getTp() / chr.getIntelligence()));
		}
		
		public function getBaseStrength(): uint {
			return this.baseStr;
		}
		
		public function getBaseAgility(): uint {
			return this.baseAgl;
		}
		
		public function getBaseIntelligence(): uint {
			return this.baseInt;
		}
		
		public function getBaseHp(): uint {
			return this.baseHp;
		}
		
		public function getBaseTp(): uint {
			return this.baseTp;
		}
		
		public function getChanceStrIncrease(): uint {
			return this.chanceStrIncrease;
		}
		
		public function getChanceAglIncrease(): uint {
			return this.chanceAglIncrease;
		}
		
		public function getChanceIntIncrease(): uint {
			return this.chanceIntIncrease;
		}
		
		public function getChanceHpIncrease(): uint {
			return this.chanceHpIncrease;
		}
		
		public function getChanceTpIncrease(): uint {
			return this.chanceTpIncrease;
		}
	}

}