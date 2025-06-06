package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import objects.Player;
import subStates.PauseSubState;

using StringTools;

class PlayState extends FlxState
{
	var player:Player;

	var camHUD:FlxCamera;
	var scoreText:FlxText;
	var score:Int = 0;
	var scoreGet:Int = 200;
	var healthBar:FlxBar;
	var health:Float = 100; // as percent
	var displayHealth:Float = 100; // lerping stuff

	var level:Int = 1;

	override public function create()
	{
		super.create();

		camHUD = new FlxCamera();
		camHUD.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(camHUD, false);

		player = new Player(20, 20);
		player.active = true;
		add(player);

		camera.follow(player, PLATFORMER, 0.15);

		scoreText = new FlxText(10, 10, 0, "Score: " + Std.string(score), 24);
		scoreText.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);
		scoreText.camera = camHUD;
		add(scoreText);

		healthBar = new FlxBar(10, 10, LEFT_TO_RIGHT, 300, 20, this, "health", 0, 100, true);
		healthBar.createFilledBar(FlxColor.RED, FlxColor.LIME, FlxColor.WHITE, 2);
		healthBar.percent = health; // as percent
		healthBar.camera = camHUD;
		add(healthBar);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.ESCAPE)
		{
			openSubState(new PauseSubState(0x4FC4C4C4));
		}

		// handle score lerp thing
		var diff = Math.abs(score - scoreGet);
		var alpha = diff < 1 ? 1.0 : 0.4;
		score = Std.int(FlxMath.lerp(score, scoreGet, alpha));
		scoreText.text = "Score: " + Std.string(score);
		// handle health lerp
		displayHealth = FlxMath.lerp(displayHealth, health, 0.15);
		healthBar.percent = displayHealth;

		if (FlxG.keys.justPressed.SPACE)
		{
			health = FlxG.random.int(1, 100);
		}
	}
}
