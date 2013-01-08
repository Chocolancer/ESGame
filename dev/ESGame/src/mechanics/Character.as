package mechanics 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Character 
	{
		//default values
		public var classType: String;
		public var element: String = "Ram";
		public var strength: uint;
		public var agility: uint;
		public var intelligence: uint;
		public var hp: uint;
		public var tp: uint
		
		public var weapon: Weapon;
		public var armor: Armor;
		public var accessory: Accessory;
		public var tpRecovery: uint = 10;
		
		//rates; must be between 0 to 100
		public var armorEffective: uint;
		public var critical: uint;
		public var elementFactor: uint;
		private var chanceStrIncrease: uint;
		private var chanceAglIncrease: uint;
		private var chanceIntIncrease: uint;
		private var chanceHpIncrease: uint;
		private var chanceTpIncrease: uint;
				
		public function Character(classT: String = "Enemy", str: uint = 5, agl: uint = 5, intl: uint = 5, hp: uint = 1, tp: uint = 0) 
		{
			this.classType = classT;
			this.strength = str;
			this.agility = agl;
			this.intelligence = intl;
			
			if (classType == "Enemy") {
				this.hp = hp;
				this.tp = tp;
			}
			else {
				//base scale factors are from 1 to 10
				switch(classType) {
					case "Soldier":
						this.hp = 8 * this.strength;
						this.tp = 2 * this.intelligence;
						this.chanceStrIncrease = this.chanceHpIncrease = 80;
						this.chanceAglIncrease = 50;
						this.chanceIntIncrease = this.chanceTpIncrease = 20;
						break;
					case "Ranger":
						this.hp = 6 * this.strength;
						this.tp = 4 * this.intelligence;
						this.chanceStrIncrease = this.chanceHpIncrease = 60;
						this.chanceAglIncrease = 70;
						this.chanceIntIncrease = this.chanceTpIncrease = 40;
						break;
					case "Assassin":
						this.hp = 4 * this.strength;
						this.tp = 6 * this.intelligence;
						this.chanceStrIncrease = this.chanceHpIncrease = 40;
						this.chanceAglIncrease = 70;
						this.chanceIntIncrease = this.chanceTpIncrease = 60;
						break;
					case "Thaumaturge":
						this.hp = 3 * this.strength;
						this.tp = 7 * this.intelligence;
						this.chanceStrIncrease = this.chanceHpIncrease = 20;
						this.chanceAglIncrease = 40;
						this.chanceIntIncrease = this.chanceTpIncrease = 80;
						break;
					default:
						this.hp = 5 * this.strength;
						this.tp = 5 * this.intelligence;
						this.chanceStrIncrease = this.chanceAglIncrease = this.chanceIntIncrease = this.chanceHpIncrease = this.chanceTpIncrease = 50;
						break;
				}
				this.tpRecovery = Math.ceil(this.tp / this.intelligence);
			}
			
		}
		
		public function levelUp(): void {
			
			var chance: uint = 1 + Math.floor(Math.random() * 100);
			var statFactor: uint = 1 + Math.floor(Math.random() * 5);
			var hptpFactor: uint = 20 + Math.floor(Math.random() * 81);
			
			if (chance < chanceStrIncrease) {
				this.strength += statFactor;
			}
			if (chance < chanceAglIncrease) {
				this.agility += statFactor;
			}
			if (chance < chanceIntIncrease) {
				this.intelligence += statFactor;
			}
			if (chance < chanceHpIncrease) {
				this.hp += hptpFactor;
			}
			if (chance < chanceTpIncrease) {
				this.tp += hptpFactor;
			}
			this.tpRecovery = Math.ceil(this.tp / this.intelligence);
			calculateNewAttackStats();
		}
		
		public function calculateNewAttackStats(): void {
			
		}
		
		public function equip(newWeapon: Weapon, newArmor: Armor, newAccessory: Accessory) {
			
		}
	}
}