package overworld.room 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class Room1 extends BaseRoom 
	{
			override public function setData():void
			{
				floorCSV = roomData.floor1;
				wallCSV = roomData.walls1;
				doorsCSV = roomData.doors1;
				roomNumber = 1;
			}
	}
}