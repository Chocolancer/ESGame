package mechanics 
{
	import mechanics.characters.Character;
	import mechanics.classes.GameClass;
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
		//public function getBattleOrder(mainParty: Party, enemyParty: Party): Vector.<Character>  {
			//
		//}
	//
		//reads a command taken from the state
		//public function readCommand(skillCategory: String, skill: String) {
			//
		//}
		
		public function startBattleStep(attacker: Character, defender: Character): uint {
			//NON-ELEMENTAL CALCULATION
			var damage: uint = attacker.getClass().attack(attacker.getWeapon().getPhysicalDamage(), attacker.getClass().getPrimarySecondaryStat(attacker, GameClass.PRIMARY_STAT)) -
							   defender.getClass().defend(defender.getArmor().getPhysicalDefense(), defender.getClass().getPrimarySecondaryStat(defender, GameClass.PRIMARY_STAT));
			
			//WEAKNESS CALCULATION: defense is bypassed and elemental damage applies
			if ((attacker.getWeapon().getElement().getElementName() == Elements.RAHM && defender.getArmor().getElement().getElementName() == Elements.LUM)
			|| (attacker.getWeapon().getElement().getElementName() == Elements.LUM && defender.getArmor().getElement().getElementName() == Elements.EM)
			|| (attacker.getWeapon().getElement().getElementName() == Elements.EM && defender.getArmor().getElement().getElementName() == Elements.RAHM)) {
				damage = (attacker.getClass().attack(attacker.getWeapon().getElementalDamage(), attacker.getClass().getPrimarySecondaryStat(attacker, GameClass.PRIMARY_STAT)));
			}
			
			//STRENGTH CALCULATION: defense is multiplied by elemental multiplier, elemental damage doesn't apply
			if ((attacker.getWeapon().getElement().getElementName() == Elements.RAHM && defender.getArmor().getElement().getElementName() == Elements.EM)
			|| (attacker.getWeapon().getElement().getElementName() == Elements.EM && defender.getArmor().getElement().getElementName() == Elements.LUM)
			|| (attacker.getWeapon().getElement().getElementName() == Elements.LUM && defender.getArmor().getElement().getElementName() == Elements.RAHM)) {
				damage = attacker.getClass().attack(attacker.getWeapon().getPhysicalDamage(), attacker.getClass().getPrimarySecondaryStat(attacker, GameClass.PRIMARY_STAT)) -
						 defender.getClass().defend(defender.getArmor().getElementalDefense(), defender.getClass().getPrimarySecondaryStat(defender, GameClass.PRIMARY_STAT));
			}
			
			defender.setHp(defender.getHp() - damage);
			return damage;
		}
		
		//true: battle ends, false: battle ongoing
		public function endBattle(mainParty: Party, enemyParty: Party): Boolean {
			return false;
		}
	}

}