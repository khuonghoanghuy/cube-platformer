package objects;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	public var speed:Int = 50;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		makeGraphic(64, 64);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			this.x -= speed;
		}

		if (FlxG.keys.anyPressed([RIGHT, D]))
		{
			this.x += speed;
		}
	}
}
