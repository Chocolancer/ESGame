package mechanics.classes 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Assassin extends GameClass
	{
		
		public function Assassin() 
		{
			this._className = "Assassin";
			
			this._primaryStat = "Intelligence";
			this._secondaryStat = "Agility";
			
			this._baseStr = 10;
			this._baseAgl = 15;
			this._baseInt = 15;
			this._baseHp = 4 * this._baseStr;
			this._baseTp = 6 * this._baseInt;
			
			this._chanceStrIncrease = 10;
			this._chanceAglIncrease = 70;
			this._chanceIntIncrease = 20;
			
			this._chanceHpIncrease = 40;
			this._chanceTpIncrease = 60;
		}
		
	}

}