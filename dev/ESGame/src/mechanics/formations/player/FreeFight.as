package mechanics.formations.player 
{
	import mechanics.formations.Formation;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class FreeFight extends Formation
	{
		
		//default formation; no bonuses
		public function FreeFight(width: uint, height: uint, size: uint = 4) 
		{
			super(size);
			
			for (var i: uint = 0; i < _size; i++) {
				_bonusAgility[i] = 0;
				_bonusIntelligence[i] = 0;
				_bonusStrength[i] = 0;
				formationx[i] = width / 2;
				formationy[i] = (height / 4) * (i + 1);
			}
		}
		
	}

}