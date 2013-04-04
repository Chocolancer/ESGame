package mechanics.characters 
{
	/**
	 * ...
	 * @author Jason Bolanos & Matt Fisher
	 */
	public class PlayableCharacter extends BattleCharacter
	{
		
		public function PlayableCharacter(name: String, spritePath: String, classT: String, str: uint, agl: uint, intl: uint, hp: uint, tp: uint)
		{
			super(name, spritePath, classT, str, agl, intl, hp, tp);
		}
		
	}

}