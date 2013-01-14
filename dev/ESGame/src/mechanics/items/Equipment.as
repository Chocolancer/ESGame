package mechanics.items 
{
	import mechanics.Element;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Equipment 
	{
		protected var _name: String;
		protected var _element: Element;
		
		public function Equipment(equipname: String, element: String, elementMultiplier: uint) 
		{
			this._name = equipname;
			this._element = new Element(element, elementMultiplier);
		}
		
		public function getElement(): Element {
			return this._element;
		}
		
		public function getName(): String {
			return _name;
		}
	}

}