package mechanics.classes 
{
	import mechanics.characters.BattleCharacter;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class GameClass 
	{
		
		public static const PRIMARY_STAT: String = "Primary";
		public static const SECONDARY_STAT: String = "Secondary";
		
		protected var _className: String;
		
		protected var _primaryStat: String;
		protected var _secondaryStat: String;
		
		//base stats
		protected var _baseStr: uint;
		protected var _baseAgl: uint;
		protected var _baseInt: uint;
		protected var _baseHp: uint;
		protected var _baseTp: uint;
		
		//rates; must be between 0 to 100
		protected var _chanceStrIncrease: uint;
		protected var _chanceAglIncrease: uint;
		protected var _chanceIntIncrease: uint;
		protected var _chanceHpIncrease: uint;
		protected var _chanceTpIncrease: uint;
		
		public function GameClass() { }
		
		public function getStat(chr: BattleCharacter, stat: String): uint {
			var determiningStat: String;
			var statToReturn: uint;
			
			//check what the function should be looking for
			switch (stat) {
				case GameClass.PRIMARY_STAT:
					determiningStat = this._primaryStat;
					break;
				case GameClass.SECONDARY_STAT:
					determiningStat = this._secondaryStat;
			}
			
			//then get it
			switch (determiningStat) {
				case "Strength":
					statToReturn = chr.strength;
					break;
				case "Agility":
					statToReturn = chr.agility;
					break;
				case "Intelligence":
					statToReturn = chr.intelligence;
					break;
			}
			
			return statToReturn;
		}
		
		public function attack(weaponDamage: uint, primaryStat: uint): int {
			return weaponDamage + primaryStat;
		}
		
		public function attackTech(techMultiplier: uint, weaponDamage: uint, primaryStat: uint): int {
			return (weaponDamage + primaryStat) * techMultiplier;
		}
		
		public function defend(armorDefense: uint, primaryStat: uint): uint {
			return armorDefense + primaryStat;
		}
		
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
			
			return new EmptyClass();
		}
		
		public function setBaseStats(chr: BattleCharacter): void {
			chr.strength = _baseStr;
			chr.agility = _baseAgl;
			chr.intelligence = _baseInt;
			chr.maxhp = _baseHp;
			chr.maxtp = _baseTp;
			chr.currhp = _baseHp;
			chr.currtp = _baseTp;
			chr.tpRecovery = Math.ceil(chr.maxtp / chr.intelligence);
		}
		
		public function get className():String 
		{
			return _className;
		}
		
		public function get chanceStrIncrease():uint 
		{
			return _chanceStrIncrease;
		}
		
		public function get chanceAglIncrease():uint 
		{
			return _chanceAglIncrease;
		}
		
		public function get chanceIntIncrease():uint 
		{
			return _chanceIntIncrease;
		}
		
		public function get chanceHpIncrease():uint 
		{
			return _chanceHpIncrease;
		}
		
		public function get chanceTpIncrease():uint 
		{
			return _chanceTpIncrease;
		}
	}

}