package mechanics.formations.player 
{
	import mechanics.formations.Formation;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Caravan extends Formation
	{
		//diamond formation
		public function Caravan(width: uint, height: uint) 
		{
			super(4);
			
			_bonusAgility[0] = 5;
			_bonusAgility[1] = 6;
			_bonusAgility[2] = 6;
			_bonusAgility[3] = 8;
			_bonusIntelligence[0] = 2;
			_bonusIntelligence[1] = 5;
			_bonusIntelligence[2] = 5;
			_bonusIntelligence[3] = 8;
			_bonusStrength[0] = 6;
			_bonusStrength[1] = 4;
			_bonusStrength[2] = 4;
			_bonusStrength[3] = 0;
			
			formationx[0] = width / 4;
			formationy[0] = height / 2;
			formationx[1] = width / 2;
			formationy[1] = height / 2 - height / 4;
			formationx[2] = width / 2;
			formationy[2] = height / 2 + height / 4;
			formationx[3] = width / 4 * 3;
			formationy[3] = height / 2;
		}
		
	}

}