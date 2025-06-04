package handler;

import flixel.FlxG;

class TraceLog
{
	public static function traced(key:String)
	{
		FlxG.log.add(key);
		trace(key);
	}
}
