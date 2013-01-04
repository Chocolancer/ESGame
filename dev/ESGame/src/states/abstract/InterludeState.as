package states.abstract 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class InterludeState extends FlxState
	{
		protected var textCollection: Vector.<String> = new Vector.<string>();
		private var labelCollection: Object = new Object();
		
		public var numLines = 0;
		public var delay: int = 200;
		public var effect: String = "fadein";
		
		override public function crate(): void {
			for (var line: String in textCollection) {
				labelCollection[numLines] = new FlxText(
				numLines++;
			}
		}
		
		override public function update(): void {
			
		}
		
		public function InterludeState() 
		{
			super();
		}
		
	}

}