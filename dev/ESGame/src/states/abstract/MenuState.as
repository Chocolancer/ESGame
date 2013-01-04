package states.abstract 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class MenuState extends FlxState
	{
		protected var buttonCollection: Object = new Object();
		protected var panelCollection: Object = new Object();
		protected var textCollection: Object = new Object();
		
		public function addAllCoreComponents(): void {
			for (var key: String in panelCollection) {
				add(panelCollection[key] as FlxBasic);
			}
			
			for (var key: String in textCollection) {
				add(textCollection[key] as FlxBasic);
			}
			
			for (var key: String in buttonCollection) {
				add(buttonCollection[key] as FlxBasic);
			}
		}
		
		public function MenuState() 
		{
			super();
		}
		
	}

}