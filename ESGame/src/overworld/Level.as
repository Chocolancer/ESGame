package overworld 
{
	
	/**
	 * Base class for all game levels
	 * 
	 * @author Matthew Fisher
	 */
	public interface Level 
	{
		/**
		 * Create the whole level, including all sprites, maps, blocks, etc
		 */
		function create(): void;
	}
	
}