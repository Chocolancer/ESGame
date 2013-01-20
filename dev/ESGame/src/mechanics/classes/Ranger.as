package mechanics.classes 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Ranger extends GameClass
	{
		
		public function Ranger() 
		{
			this._className = "Ranger";
			
			this._primaryStat = "Strength";
			this._secondaryStat = "Agility";
			
			this._baseStr = 15;
			this._baseAgl = 15;
			this._baseInt = 10;
			this._baseHp = 6 * this._baseStr;
			this._baseTp = 4 * this._baseInt;
			
			this._chanceStrIncrease = 20;
			this._chanceAglIncrease = 70;
			this._chanceIntIncrease = 10;
			
			this._chanceHpIncrease = 60;
			this._chanceTpIncrease = 40;
		}
		
	}

}