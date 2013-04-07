package
{
	import states.*;
	import org.flixel.*;

	/**
	* @author Matthew Fisher
	*/
	[SWF(width=640, height=480, backgroundColor="#ffffff")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(640, 480, TestFieldState, 1);
			//super(640, 480, TestBattleState, 1);
		}
	}
}