package mechanics.formations.player 
{
	import mechanics.formations.Formation;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Linear extends Formation
	{
		//forward line formation
		public function Linear(width: uint, height: uint) 
		{
			super(4);
			
			_bonusAgility[0] = 0;
			_bonusAgility[1] = 2;
			_bonusAgility[2] = 5;
			_bonusAgility[3] = 8;
			_bonusIntelligence[0] = 0;
			_bonusIntelligence[1] = 2;
			_bonusIntelligence[2] = 3;
			_bonusIntelligence[3] = 5;
			_bonusStrength[0] = 8;
			_bonusStrength[1] = 5;
			_bonusStrength[2] = 2;
			_bonusStrength[3] = 0;
			
			for (var i: uint = 0; i < _size; i++) {
				formationx[i] = (width / 4) * i;
				formationy[i] = height / 2;
			}
		}
		
	}

}