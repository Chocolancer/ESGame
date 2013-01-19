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
			this.className = "Thaumaturge";
			
			//this.primaryStat = "Intelligence";
			
			this.baseStr = 5;
			this.baseAgl = 15;
			this.baseInt = 20;
			this.baseHp = 2 * this.baseStr;
			this.baseTp = 8 * this.baseInt;
			
			this.chanceStrIncrease = 10;
			this.chanceAglIncrease = 30;
			this.chanceIntIncrease = 60;
			
			this.chanceHpIncrease = 30;
			this.chanceTpIncrease = 70;
		}
		
	}

}