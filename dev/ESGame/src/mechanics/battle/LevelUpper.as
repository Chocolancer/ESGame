package mechanics.battle 
{
	import mechanics.characters.Character;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class LevelUpper 
	{
		public function LevelUpper() { }
		
		public static function levelUp(chr: Character): void {
			
			var statsChance: uint = 1 + Math.floor(Math.random() * 100);
			var hptpChance: uint = 1 + Math.floor(Math.random() * 100);
			
			var statFactor: uint = 1 + Math.floor(Math.random() * 5); //increases between 1-5
			var hptpFactor: uint = 20 + Math.floor(Math.random() * 81); //increases between 20-100
			
			if (statsChance < chr.getClass().getChanceStrIncrease()) {
				chr.setStrength(chr.getStrength() + statFactor);
			}
			if (statsChance < chr.getClass().getChanceAglIncrease()) {
				chr.setAgility(chr.getAgility() + statFactor);
			}
			if (statsChance < chr.getClass().getChanceIntIncrease()) {
				chr.setIntelligence(chr.getIntelligence() + statFactor);
			}
			
			if (hptpChance < chr.getClass().getChanceHpIncrease()) {
				chr.setMaxHp(chr.getMaxHp() + hptpFactor);
				chr.setCurrentHp(chr.getCurrentHp() + hptpFactor);
			}
			if (hptpChance < chr.getClass().getChanceTpIncrease()) {
				chr.setMaxHp(chr.getMaxHp() + hptpFactor);
				chr.setCurrentTp(chr.getCurrentTp() + hptpFactor);
			}
			
			chr.setTpRecovery(Math.ceil(chr.getMaxTp() / chr.getIntelligence()));
			
			//return a response to see which stats increased for front-end to process
		}
	}

}