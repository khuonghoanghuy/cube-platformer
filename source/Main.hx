package;

import flixel.FlxGame;
import flixel.FlxSprite;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, states.PlayState));
		trace("Game Version: " + Lib.application.meta.get("version"));

		FlxSprite.defaultAntialiasing = false;
	}
}
