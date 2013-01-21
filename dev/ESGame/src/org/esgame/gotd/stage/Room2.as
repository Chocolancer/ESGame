package org.esgame.gotd.stage 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class Room2 extends BaseStage 
	{
			override public function setData():void
			{
				floorCSV = stagedata.floor2;
				wallCSV = stagedata.walls2;
				interactiveCSV = stagedata.interactive2;
				stageName = "Room 2";
			}
	}
}