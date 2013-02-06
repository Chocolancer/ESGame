package mechanics.formations 
{
	import globals.FormationNames;
	import mechanics.characters.BattleCharacter;
	import mechanics.characters.Party;
	import mechanics.formations.player.Caravan;
	import mechanics.formations.player.FreeFight;
	import mechanics.formations.player.LeftFlank;
	import mechanics.formations.player.Linear;
	import mechanics.formations.player.RightFlank;
	import mechanics.formations.player.Vanguard;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Formation 
	{
		public var formationx: Array;
		public var formationy: Array;
		protected var _bonusStrength: Array;
		protected var _bonusAgility: Array;
		protected var _bonusIntelligence: Array;
		protected var _size: uint;
		
		public function Formation(size: uint = 4) 
		{
			this._size = size;
			formationx = new Array(size);
			formationy = new Array(size);
			_bonusStrength = new Array(size);
			_bonusAgility = new Array(size);
			_bonusIntelligence = new Array(size);
		}
		
		public static function getFormation(formationName: String, width: uint, height: uint): Formation {
			switch(formationName) {
				case FormationNames.LINEAR:
					return new Linear(width, height);
					break;
				case FormationNames.CARAVAN:
					return new Caravan(width, height);
					break;
				case FormationNames.LFLANK:
					return new LeftFlank(width, height);
					break;
				case FormationNames.RFLANK:
					return new RightFlank(width, height);
					break;
				case FormationNames.VANGUARD:
					return new Vanguard(width, height);
					break;
				default:
					return new FreeFight(width, height);
					break;
			}
		}
		
		public function applyBonuses(theParty: Party): void {
			for (var i: uint = 0; i < theParty.members.length; i++) {
				theParty.members[i].strength = _bonusStrength[i];
				theParty.members[i].agility = _bonusAgility[i];
				theParty.members[i].intelligence = _bonusIntelligence[i];
			}
		}
		
	}

}