package 
{
	import org.flixel.*;
	import org.esgame.gotd.state.PlayState;

	/**
	 * @author Matthew Fisher
	 */
	[SWF(width=480, height=480, backgroundColor="#ffffff")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(240, 240, PlayState, 2);
		}
	}
}