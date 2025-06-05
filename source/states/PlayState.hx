package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import subStates.PauseSubState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxText("Hello World", 32).screenCenter());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.ESCAPE)
		{
			openSubState(new PauseSubState(0x4FC4C4C4));
		}
	}
}
