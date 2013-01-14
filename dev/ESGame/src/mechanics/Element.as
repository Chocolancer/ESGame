package mechanics 
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
		
		public function getElementName(): String {
			return this._elementName;
		}
		
		public function getElementMultiplier(): uint {
			return this._multiplier;
		}
	}

}