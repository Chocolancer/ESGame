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
			this.className = "Assassin";
			
			this.primaryStat = "Intelligence";
			this.secondaryStat = "Agility";
			
			this.baseStr = 10;
			this.baseAgl = 15;
			this.baseInt = 15;
			this.baseHp = 4 * this.baseStr;
			this.baseTp = 6 * this.baseInt;
			
			this.chanceStrIncrease = 10;
			this.chanceAglIncrease = 70;
			this.chanceIntIncrease = 20;
			
			this.chanceHpIncrease = 40;
			this.chanceTpIncrease = 60;
		}
		
	}

}