package mechanics.characters 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Party 
	{
		private var _members: Vector.<Character>;
		private var formationBonus
		
		public function Party() 
		{
			
		}
		
		public function get members():Vector.<Character> 
		{
			return _members;
		}
		
		public function set members(value:Vector.<Character>):void 
		{
			_members = value;
		}
		
		
		
		
	}

}