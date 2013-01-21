package 
{
	import org.flixel.*;
	import org.esgame.gotd.state.PlayState;
	
	/**
	 * Main class initializes the window.
	 * 
	 * @author Jason Bolanos
	 */
	
	[SWF(width="240", height="240", backgroundColor="#000000")] //I think there should be a way to toggle resolution.
	public class Main extends FlxGame
	{
		
		public function Main() 
		{
			super(240, 240, PlayState, 1);
		}
		
	}

}