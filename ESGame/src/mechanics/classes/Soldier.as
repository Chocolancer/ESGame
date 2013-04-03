package mechanics.classes 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Soldier extends GameClass
	{
		
		public function Soldier() 
		{
			this._className = "Soldier";
			
			this._primaryStat = "Strength";
			
			this._baseStr = 20;
			this._baseAgl = 15;
			this._baseInt = 5;
			this._baseHp = 8 * this._baseStr;
			this._baseTp = 2 * this._baseInt;
			
			this._chanceStrIncrease = 60;
			this._chanceAglIncrease = 30;
			this._chanceIntIncrease = 10;
			
			this._chanceHpIncrease = 70;
			this._chanceTpIncrease = 30;
		}
	}

}