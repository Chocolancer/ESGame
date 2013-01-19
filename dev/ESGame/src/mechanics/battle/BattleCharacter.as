package mechanics.battle 
{
	import mechanics.characters.Character;
	import mechanics.classes.GameClass;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleCharacter 
	{
		private var character: Character;
		
		public function BattleCharacter(char: Character) 
		{
			this.character = char;
		}
		
		public function attack(isElemental: Boolean): int {
			return	character.getClass().attack(this.getWeaponDamage(isElemental), this.getPrimaryStat());
		}
		
		public function defend(isElemental: Boolean): int {
			return character.getClass().defend(this.getArmorDefense(isElemental), this.getPrimaryStat());
		}
		
		public function getWeaponDamage(isElemental: Boolean): uint {
			return (isElemental ? character.getWeapon().getElementalDamage() : character.getWeapon().getPhysicalDamage());
		}
		
		public function getArmorDefense(isElemental: Boolean): uint {
			return (isElemental ? character.getArmor().getElementalDefense() : character.getArmor().getPhysicalDefense());
		}
		
		public function getArmorElementName(): String {
			return character.getArmor().getElement().getElementName();
		}
		
		public function getWeaponElementName(): String {
			return character.getWeapon().getElement().getElementName();
		}
		
		public function getPrimaryStat(): uint {
			return character.getClass().getStat(character, GameClass.PRIMARY_STAT);
		}
		
		public function getSecondaryStat(): uint {
			return character.getClass().getStat(character, GameClass.SECONDARY_STAT);
		}
		
		public function getCharacter(): Character {
			return this.character;
		}
		
	}

}