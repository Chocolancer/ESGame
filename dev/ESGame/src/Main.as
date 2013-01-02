package 
{
	import org.flixel.*;
	import states.*;
	
	/**
	 * Main class initializes the window.
	 * 
	 * @author Jason Bolanos
	 */
	
	[SWF(width="640", height="480", backgroundColor="#000000")] //I think there should be a way to toggle resolution.
	public class Main extends FlxGame
	{
		
		public function Main() 
		{
			super(640, 480, TitleState, 1);
		}
		
	}

}