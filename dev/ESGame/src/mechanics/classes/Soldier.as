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
			this.className = "Soldier";
			
			this.baseStr = 20;
			this.baseAgl = 15;
			this.baseInt = 5;
			this.baseHp = 8 * this.baseStr;
			this.baseTp = 2 * this.baseInt;
			
			this.chanceStrIncrease = 60;
			this.chanceAglIncrease = 30;
			this.chanceIntIncrease = 10;
			
			this.chanceHpIncrease = 70;
			this.chanceTpIncrease = 30;
		}
	}

}