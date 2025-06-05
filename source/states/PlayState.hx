package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import objects.Player;
import subStates.PauseSubState;

class PlayState extends FlxState
{
	public var player:Player;
	public var scoreText:FlxText;

	override public function create()
	{
		super.create();
		add(new FlxText("Hello World", 32).screenCenter());

		player = new Player(20, 20);
		player.active = true;
		add(player);

		camera.target = player;
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
