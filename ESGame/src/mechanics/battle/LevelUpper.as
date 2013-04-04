package mechanics.battle 
{
	import mechanics.characters.PlayableCharacter;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class LevelUpper 
	{
		public function LevelUpper() { }
		
		public static function levelUp(chr: PlayableCharacter): void {
			
			var statsChance: uint = 1 + Math.floor(Math.random() * 100);
			var hptpChance: uint = 1 + Math.floor(Math.random() * 100);
			
			var statFactor: uint = 1 + Math.floor(Math.random() * 5); //increases between 1-5
			var hptpFactor: uint = 20 + Math.floor(Math.random() * 81); //increases between 20-100
			
			if (statsChance < chr.classType.chanceStrIncrease) {
				chr.strength = chr.strength + statFactor;
			}
			if (statsChance < chr.classType.chanceAglIncrease) {
				chr.agility = chr.agility + statFactor;
			}
			if (statsChance < chr.classType.chanceIntIncrease) {
				chr.intelligence = chr.intelligence + statFactor;
			}
			
			if (hptpChance < chr.classType.chanceHpIncrease) {
				chr.maxhp = chr.maxhp + hptpFactor;
				chr.currhp = chr.currhp + hptpFactor;
			}
			if (hptpChance < chr.classType.chanceTpIncrease) {
				chr.maxtp = chr.maxtp + hptpFactor;
				chr.currtp = chr.currtp + hptpFactor;
			}
			
			chr.tpRecovery = Math.ceil(chr.tpRecovery / chr.intelligence);
			
			//return a response to see which stats increased for front-end to process
		}
	}

}