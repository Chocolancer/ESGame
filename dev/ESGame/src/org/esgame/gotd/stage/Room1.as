package org.esgame.gotd.stage 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class Room1 extends BaseStage 
	{
			override public function setData():void
			{
				floorCSV = stagedata.floor1;
				wallCSV = stagedata.walls1;
				interactiveCSV = stagedata.interactive1;
				stageName = "Room 1";
			}
	}
}