package globals 
{
	/**
	 * Collection of global story flags.
	 * 
	 * @author Jason Bolanos
	 */
	public class StoryFlags 
	{
		/**
		 * The player character's chosen storyline path:
			 * 1 - Path of Insurrection
			 * 2 - Path of Exile
			 * 3 - Path of Freedom
		 */
		public static final var PATH: uint;
		
		//PATH OF EXILE FLAGS
		public static final var ISHTAR_FIRST_TIME: Boolean;
		
		//PATH OF INSURRECTION FLAGS
		public static final var MET_XEP_AND_311: Boolean;
		
		public static final var BARONIEL_FIRST_TIME: Boolean;
		
		//PATH OF FREEDOM FLAGS
		public static final var KAFUL_FIRST_TIME: Boolean;
	}

}