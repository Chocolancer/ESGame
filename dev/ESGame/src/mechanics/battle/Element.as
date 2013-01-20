package mechanics.battle 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Element 
	{
		private var _multiplier: uint;
		private var _elementName: String;

		public function Element(name: String, mult: uint) 
		{
			this._elementName = name;
			this._multiplier = mult;
		}
		
		public function get elementName():String 
		{
			return _elementName;
		}
		
		public function get multiplier():uint 
		{
			return _multiplier;
		}
	}

}