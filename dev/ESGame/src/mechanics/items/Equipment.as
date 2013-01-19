package mechanics.items 
{
	import mechanics.battle.Element;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class Equipment 
	{
		protected var _name: String;
		protected var _description: String;
		protected var _element: Element;
		
		public function Equipment(equipname: String, desc: String, element: String, elementMultiplier: uint) 
		{
			this._name = equipname;
			this._description = desc;
			this._element = new Element(element, elementMultiplier);
		}
		
		public function getElement(): Element {
			return this._element;
		}
		
		public function getDescription(): String {
			return this._description;
		}
		
		public function getName(): String {
			return _name;
		}
	}

}