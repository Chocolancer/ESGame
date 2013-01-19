package mechanics.battle 
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
		
		public function startBattleStep(attacker: BattleCharacter, defender: BattleCharacter): int {
			//NON-ELEMENTAL CALCULATION
			var damage: int = attacker.attack(false) - defender.defend(false);
			
			//IF NON-ELEMENTAL AND ENEMY DOES LESS THAN 0 DAMAGE, THEN THERE IS NO DAMAGE
			(damage < 0) ? damage = 0 : damage;
			
			//WEAKNESS CALCULATION: defense is bypassed and elemental damage applies
			if ((attacker.getWeaponElementName() == Elements.RAHM && defender.getArmorElementName() == Elements.LUM)
			|| (attacker.getWeaponElementName() == Elements.LUM && defender.getArmorElementName() == Elements.EM)
			|| (attacker.getWeaponElementName() == Elements.EM && defender.getArmorElementName() == Elements.RAHM)) {
				damage = attacker.attack(true) - defender.defend(false);
			}
			
			//STRENGTH CALCULATION: defense is multiplied by elemental multiplier, elemental damage doesn't apply
			if ((attacker.getWeaponElementName() == Elements.RAHM && defender.getArmorElementName() == Elements.EM)
			|| (attacker.getWeaponElementName() == Elements.EM && defender.getArmorElementName() == Elements.LUM)
			|| (attacker.getWeaponElementName() == Elements.LUM && defender.getArmorElementName() == Elements.RAHM)) {
				damage = attacker.attack(false) - defender.defend(true);
			}
			
			defender.getCharacter().setCurrentHp(defender.getCharacter().getCurrentHp() - damage);
			return damage;
		}
		
		//true: battle ends, false: battle ongoing
		public function endBattle(mainParty: Party, enemyParty: Party): Boolean {
			return false;
		}
	}

}