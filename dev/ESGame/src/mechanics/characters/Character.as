package mechanics.characters 
{
	import mechanics.classes.*;
	import mechanics.items.Armor;
	import mechanics.items.Weapon;
	import mechanics.items.Accessory;
	import mechanics.LevelUpper;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Character 
	{
		//default values
		private var classType: GameClass;
		private var characterName: String;
		
		private var strength: uint;
		private var agility: uint;
		private var intelligence: uint;
		private var hp: uint;
		private var tp: uint;
		private var tpRecovery: uint;
		
		private var weapon: Weapon;
		private var armor: Armor;
		private var accessory: Accessory;
				
		public function Character(charName: String, classT: String = "Enemy", str: uint = 5, agl: uint = 5, intl: uint = 5, hp: uint = 1, tp: uint = 0) 
		{
			this.characterName = charName;
			this.classType = GameClass.getClass(classT);
			
			this.strength = str;
			this.agility = agl;
			this.intelligence = intl;
			this.hp = hp;
			this.tp = tp;
			this.tpRecovery = Math.ceil(this.tp / this.intelligence);
		}
		
		public function getClass(): GameClass {
			return classType;
		}
		
		public function getStrength(): uint {
			return this.strength;
		}
		
		public function getAgility(): uint {
			return this.agility;
		}
		
		public function getIntelligence(): uint {
			return this.intelligence;
		}
		
		public function getHp(): uint {
			return this.hp;
		}
		
		public function getTp(): uint {
			return this.tp;
		}
		
		public function getTpRecovery(): uint {
			return this.tpRecovery;
		}
		
		public function getWeapon(): Weapon {
			return this.weapon;
		}
		
		public function getArmor(): Armor {
			return this.armor;
		}
		
		public function getAccessory(): Accessory {
			return this.accessory;
		}
		
		public function setStrength(newStr: uint): void {
			this.strength = newStr;
		}
		
		public function setAgility(newAgl: uint): void {
			this.agility = newAgl;
		}
		
		public function setIntelligence(newInt: uint): void {
			this.intelligence = newInt;
		}
		
		public function setHp(newHP: uint): void {
			this.hp = newHP;
		}
		
		public function setTp(newTP: uint): void {
			this.tp = newTP;
		}
		
		public function setTpRecovery(newTPRecovery: uint): void {
			this.tpRecovery = newTPRecovery;
		}
		
		public function setWeapon(newWeapon: Weapon): void {
			this.weapon = newWeapon;
		}
		
		public function setArmor(newArmor: Armor): void {
			this.armor = newArmor;
		}
		
		public function setAccessory(newAcc: Accessory): void {
			this.accessory = newAcc;
		}
	}
}