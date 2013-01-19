package mechanics.classes 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Enemy extends GameClass
	{
		
		public function Enemy() 
		{
			this.className = "Enemy";
			
			this.primaryStat = "Strength";
			
			this.baseStr = 5;
			this.baseAgl = 5;
			this.baseInt = 5;
			this.baseHp = 5;
			this.baseTp = 5;
			
			this.chanceStrIncrease = 0;
			this.chanceAglIncrease = 0;
			this.chanceIntIncrease = 0;
			
			this.chanceHpIncrease = 0;
			this.chanceTpIncrease = 0;
		}
		
	}

}