package mechanics.classes 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Thaumaturge extends GameClass
	{
		
		public function Thaumaturge() 
		{
			this._className = "Thaumaturge";
			
			//this.primaryStat = "Intelligence";
			
			this._baseStr = 5;
			this._baseAgl = 15;
			this._baseInt = 20;
			this._baseHp = 2 * this._baseStr;
			this._baseTp = 8 * this._baseInt;
			
			this._chanceStrIncrease = 10;
			this._chanceAglIncrease = 30;
			this._chanceIntIncrease = 60;
			
			this._chanceHpIncrease = 30;
			this._chanceTpIncrease = 70;
		}
		
	}

}