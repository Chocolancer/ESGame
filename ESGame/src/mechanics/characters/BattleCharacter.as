package mechanics.characters 
{
	import globals.EquipmentCollection;
	import mechanics.characters.Character;
	import mechanics.classes.GameClass;
	import mechanics.items.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleCharacter extends Character
	{
		protected var _classType: GameClass;
		
		protected var _strength: uint;
		protected var _agility: uint;
		protected var _intelligence: uint;
		protected var _maxhp: uint;
		protected var _maxtp: uint;
		protected var _currenthp: int;
		protected var _currenttp: int;
		protected var _tpRecovery: uint;
		
		protected var _weapon: Weapon;
		protected var _armor: Armor;
		protected var _accessory: Accessory;
		protected var _items: Vector.<Item>;
		
		public function BattleCharacter(name: String, spriteImage: Class, classT: String, str: uint = 5, agl: uint = 5, intl: uint = 5, hp: uint = 5, tp: uint = 5) 
		{
			super(name, spriteImage);
			
			this._classType = GameClass.getClass(classT);
			
			this._strength = str;
			this._agility = agl;
			this._intelligence = intl;
			this._maxhp = this._currenthp = hp;
			this._maxtp = this._currenttp = tp;
			this._tpRecovery = Math.ceil(this._maxtp / this._intelligence);
			
			_items = new Vector.<Item>(5);
			_items.fixed = true;
			_weapon = EquipmentCollection.weaponCollection.Unarmed;
			_armor = EquipmentCollection.armorCollection.Unarmed;
		}
		
		public function attack(isElemental: Boolean): int {
			return	_classType.attack((isElemental ? _weapon.getElementalDamage() : _weapon.getPhysicalDamage()),
			this.getPrimaryStat());
		}
		
		public function defend(isElemental: Boolean): int {
			return _classType.defend((isElemental ? _armor.getElementalDefense() : _armor.getPhysicalDefense()), 
			this.getPrimaryStat());
		}
		
		public function getArmorElementName(): String {
			return _armor.element.elementName;
		}
		
		public function getWeaponElementName(): String {
			return _weapon.element.elementName;
		}
		
		public function getPrimaryStat(): uint {
			return _classType.getStat(this, GameClass.PRIMARY_STAT);
		}
		
		public function getSecondaryStat(): uint {
			return _classType.getStat(this, GameClass.SECONDARY_STAT);
		}
		
		public function get strength(): uint 
		{
			return _strength;
		}
		
		public function set strength(value:uint): void 
		{
			_strength = value;
		}
		
		public function get agility():uint 
		{
			return _agility;
		}
		
		public function set agility(value:uint):void 
		{
			_agility = value;
		}
		
		public function get intelligence():uint 
		{
			return _intelligence;
		}
		
		public function set intelligence(value:uint):void 
		{
			_intelligence = value;
		}
		
		public function get maxhp():uint 
		{
			return _maxhp;
		}
		
		public function set maxhp(value:uint):void 
		{
			_maxhp = value;
		}
		
		public function get maxtp():uint 
		{
			return _maxtp;
		}
		
		public function set maxtp(value:uint):void 
		{
			_maxtp = value;
		}
		
		public function get currenthp():int 
		{
			return _currenthp;
		}
		
		public function set currenthp(value:int):void 
		{
			this._currenthp = value;
			if (this._currenthp < 0) {
				this._currenthp = 0;
			}
			if (this._currenthp > this._maxhp) {
				this._currenthp = this._maxhp;
			}
		}
		
		public function get currenttp():int 
		{
			return _currenttp;
		}
		
		public function set currenttp(value:int):void 
		{
			this._currenttp = value;
			if (this._currenttp < 0) {
				this._currenttp = 0;
			}
			if (this._currenttp > this._maxtp) {
				this._currenttp = this._maxtp;
			}
		}
		
		public function get tpRecovery():uint 
		{
			return _tpRecovery;
		}
		
		public function set tpRecovery(value:uint):void 
		{
			_tpRecovery = value;
		}
		
		public function get weapon():Weapon 
		{
			return _weapon;
		}
		
		public function set weapon(value:Weapon):void 
		{
			_weapon = value;
		}
		
		public function get armor():Armor 
		{
			return _armor;
		}
		
		public function set armor(value:Armor):void 
		{
			_armor = value;
		}
		
		public function get accessory():Accessory 
		{
			return _accessory;
		}
		
		public function set accessory(value:Accessory):void 
		{
			_accessory = value;
		}
		
		public function get items():Vector.<Item> 
		{
			return _items;
		}
		
		public function set items(value:Vector.<Item>):void 
		{
			_items = value;
		}
		
		public function get classType():GameClass 
		{
			return _classType;
		}
	}

}