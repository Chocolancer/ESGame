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
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get description():String 
		{
			return _description;
		}
		
		public function get element():Element 
		{
			return _element;
		}
	}

}