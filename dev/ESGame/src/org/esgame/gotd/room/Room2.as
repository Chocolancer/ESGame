package org.esgame.gotd.room 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class Room2 extends BaseRoom 
	{
			override public function setData():void
			{
				floorCSV = roomData.floor2;
				wallCSV = roomData.walls2;
				doorsCSV = roomData.doors2;
				roomNumber = 2;
			}
	}
}