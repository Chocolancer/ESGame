package globals 
{
	/**
	 * ...
	 * @author Matthew Fisher
	 */
	public class RoomData 
	{
		public static var ROOM_TILE_WIDTH:uint = 16;
		public static var ROOM_TILE_HEIGHT:uint = 16;
		
		[Embed(source = "../../assets/csv/mapCSV_room1_floor.csv", mimeType = "application/octet-stream")] public var floor1:Class;
		[Embed(source = "../../assets/csv/mapCSV_room1_doors.csv", mimeType = "application/octet-stream")] public var doors1:Class;
		[Embed(source = "../../assets/csv/mapCSV_room1_walls.csv", mimeType = "application/octet-stream")] public var walls1:Class;
		
		[Embed(source = "../../assets/csv/mapCSV_room2_floor.csv", mimeType = "application/octet-stream")] public var floor2:Class;
		[Embed(source = "../../assets/csv/mapCSV_room2_doors.csv", mimeType = "application/octet-stream")] public var doors2:Class;
		[Embed(source = "../../assets/csv/mapCSV_room2_walls.csv", mimeType = "application/octet-stream")] public var walls2:Class;
	}

}