package org.esgame.gotd.assets 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class StageData 
	{
		[Embed(source = "../../../../../assets/csv/mapCSV_room1_floor.csv", mimeType = "application/octet-stream")] public var floor1:Class;
		[Embed(source = "../../../../../assets/csv/mapCSV_room1_interactive.csv", mimeType = "application/octet-stream")] public var interactive1:Class;
		[Embed(source = "../../../../../assets/csv/mapCSV_room1_walls.csv", mimeType = "application/octet-stream")] public var walls1:Class;
		
		[Embed(source = "../../../../../assets/csv/mapCSV_room2_floor.csv", mimeType = "application/octet-stream")] public var floor2:Class;
		[Embed(source = "../../../../../assets/csv/mapCSV_room2_interactive.csv", mimeType = "application/octet-stream")] public var interactive2:Class;
		[Embed(source = "../../../../../assets/csv/mapCSV_room2_walls.csv", mimeType = "application/octet-stream")] public var walls2:Class;
	}

}