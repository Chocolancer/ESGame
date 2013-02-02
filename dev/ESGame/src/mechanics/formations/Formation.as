package mechanics.formations 
{
	import mechanics.characters.Party;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Formation 
	{
		protected var formationx: Array;
		protected var formationy: Array;
		protected var bonusStrength: Array;
		protected var bonusAgility: Array;
		protected var bonusIntelligence: Array;
		
		public function Formation(size: uint = 4) 
		{
			formationx = new Array(size);
			formationy = new Array(size);
			bonusStrength = new Array(size);
			bonusAgility = new Array(size);
			bonusIntelligence = new Array(size);
		}
		
		public function applyBonuses(theParty: Party): void {
			
		}
		
	}

}