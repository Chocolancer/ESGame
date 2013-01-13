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
			this.className = "Ranger";
			
			this.baseStr = 15;
			this.baseAgl = 15;
			this.baseInt = 10;
			this.baseHp = 6 * this.baseStr;
			this.baseTp = 4 * this.baseInt;
			
			this.chanceStrIncrease = 20;
			this.chanceAglIncrease = 70;
			this.chanceIntIncrease = 10;
			
			this.chanceHpIncrease = 60;
			this.chanceTpIncrease = 40;
		}
		
	}

}