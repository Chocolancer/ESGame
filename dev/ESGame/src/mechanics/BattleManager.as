package mechanics 
{
	import mechanics.characters.Character;
	import globals.Elements;
	import mechanics.characters.Party;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class BattleManager 
	{
		
		public function BattleManager() 
		{
			
		}
		
		//returns a vector containing the order in which the battle will go
		public function getBattleOrder(mainParty: Party, enemyParty: Party): Vector.<Character>  {
			
		}
	
		//reads a command taken from the state
		public function readCommand(skillCategory: String, skill: String) {
			
		}
		
		public function startBattleStep(attackingCharacter: Character, defendingCharacter: Character): uint {
			//NON-ELEMENTAL CALCULATION
			var damage: uint = (attackingCharacter.getClass().attack(attackingCharacter.getWeapon().getPhysicalDamage()) - defendingCharacter.getClass.defend(defendingCharacter.getArmor().getPhysicalDefense()))
			
			//WEAKNESS CALCULATION: defense is bypassed and elemental damage applies
			if ((attackingCharacter.getWeapon().getElement() == Elements.RAHM && defendingCharacter.getArmor().getElement() == Elements.LUM)
			|| (attackingCharacter.getWeapon().getElement() == Elements.LUM && defendingCharacter.getArmor().getElement() == Elements.EM)
			|| (attackingCharacter.getWeapon().getElement() == Elements.EM && defendingCharacter.getArmor().getElement() == Elements.RAHM)) {
				damage = (attackingCharacter.getClass().attack(attackingCharacter.getWeapon().getElementalDamage()))
			}
			
			//STRENGTH CALCULATION: defense is multiplied by elemental multiplier, elemental damage doesn't apply
			if ((attackingCharacter.getWeapon().getElement() == Elements.RAHM && defendingCharacter.getArmor().getElement() == Elements.EM)
			|| (attackingCharacter.getWeapon().getElement() == Elements.EM && defendingCharacter.getArmor().getElement() == Elements.LUM)
			|| (attackingCharacter.getWeapon().getElement() == Elements.LUM && defendingCharacter.getArmor().getElement() == Elements.RAHM)) {
				damage = (attackingCharacter.getClass().attack(attackingCharacter.getWeapon().getPhysicalDamage()) - defendingCharacter.getClass.defend(defendingCharacter.getArmor().getElementalDefense()))
			}
			
			defendingCharacter.setHp(defendingCharacter.getHp() - damage);
			return damage;
		}
		
		//true: battle ends, false: battle ongoing
		public function endBattle(mainParty: Party, enemyParty: Party): Boolean {
			
		}
	}

}