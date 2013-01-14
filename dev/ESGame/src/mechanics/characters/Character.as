package mechanics.characters 
{
	import mechanics.classes.*;
	import mechanics.items.Armor;
	import mechanics.items.Weapon;
	import mechanics.items.Accessory;
	import mechanics.items.Item;
	import mechanics.LevelUpper;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Character 
	{
		//default values
		protected var _classType: GameClass;
		protected var _characterName: String;
		
		protected var _strength: uint;
		protected var _agility: uint;
		protected var _intelligence: uint;
		protected var _hp: uint;
		protected var _tp: uint;
		protected var _tpRecovery: uint;
		
		protected var _weapon: Weapon;
		protected var _armor: Armor;
		protected var _accessory: Accessory;
		protected var _items: Vector.<Item>;
				
		public function Character(charName: String, classT: String = "Enemy", str: uint = 5, agl: uint = 5, intl: uint = 5, hp: uint = 1, tp: uint = 0) 
		{
			this._characterName = charName;
			this._classType = GameClass.getClass(classT);
			
			this._strength = str;
			this._agility = agl;
			this._intelligence = intl;
			this._hp = hp;
			this._tp = tp;
			this._tpRecovery = Math.ceil(this._tp / this._intelligence);
			
			_items = new Vector.<Item>(5);
			_items.fixed = true;
		}
		
		public function getClass(): GameClass {
			return _classType;
		}
		
		public function getCharacterName(): String {
			return _characterName;
		}
		
		public function getStrength(): uint {
			return this._strength;
		}
		
		public function getAgility(): uint {
			return this._agility;
		}
		
		public function getIntelligence(): uint {
			return this._intelligence;
		}
		
		public function getHp(): uint {
			return this._hp;
		}
		
		public function getTp(): uint {
			return this._tp;
		}
		
		public function getTpRecovery(): uint {
			return this._tpRecovery;
		}
		
		public function getWeapon(): Weapon {
			return this._weapon;
		}
		
		public function getArmor(): Armor {
			return this._armor;
		}
		
		public function getAccessory(): Accessory {
			return this._accessory;
		}
		
		public function setCharacterName(newName: String): void {
			this._characterName = newName;
		}
		
		public function setStrength(newStr: uint): void {
			this._strength = newStr;
		}
		
		public function setAgility(newAgl: uint): void {
			this._agility = newAgl;
		}
		
		public function setIntelligence(newInt: uint): void {
			this._intelligence = newInt;
		}
		
		public function setHp(newHP: uint): void {
			this._hp = newHP;
		}
		
		public function setTp(newTP: uint): void {
			this._tp = newTP;
		}
		
		public function setTpRecovery(newTPRecovery: uint): void {
			this._tpRecovery = newTPRecovery;
		}
		
		public function setWeapon(newWeapon: Weapon): void {
			this._weapon = newWeapon;
		}
		
		public function setArmor(newArmor: Armor): void {
			this._armor = newArmor;
		}
		
		public function setAccessory(newAcc: Accessory): void {
			this._accessory = newAcc;
		}
	}
}