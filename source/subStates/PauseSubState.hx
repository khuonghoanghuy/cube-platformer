package subStates;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseSubState extends FlxSubState
{
	var list:Array<String> = ["Resume", "Restart", "Return Menu"];
	var grpList:FlxTypedGroup<FlxText>;
	var box:FlxSprite;
	var currentSelected:Int = 0;
	var bigPauseText:FlxText;
	var selectedArrow:String = "> ";

	override function create()
	{
		super.create();

		bigPauseText = new FlxText(50, 50, 0, "Game Paused", 64);
		bigPauseText.updateFramePixels();
		bigPauseText.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);
		add(bigPauseText);

		box = new FlxSprite(50, FlxG.height - 350);
		box.makeGraphic(400, 50 * list.length, FlxColor.BLACK);
		box.updateHitbox();
		add(box);

		grpList = new FlxTypedGroup<FlxText>();
		add(grpList);

		for (i in 0...list.length)
		{
			var text:FlxText = new FlxText(box.x + 20, box.y + (i * 44) + 11, 0, list[i], 32);
			text.ID = i;
			text.setBorderStyle(OUTLINE_FAST, FlxColor.BLACK, 2);
			grpList.add(text);
		}

		changeSelection(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		// default key
		if (FlxG.keys.justReleased.ESCAPE)
		{
			// resume to game
			close();
		}

		// handling thing
		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.DOWN)
			changeSelection((FlxG.keys.justPressed.UP ? -1 : 1));

		if (FlxG.keys.justPressed.ENTER)
		{
			switch (list[currentSelected])
			{
				case "Resume":
					close(); // resume game
				case "Restart":
					close(); // close first
					FlxG.resetState(); // restart later
			}
		}
	}

	function changeSelection(change:Int = 0)
	{
		currentSelected += change;
		if (currentSelected >= list.length)
			currentSelected = 0;
		if (currentSelected < 0)
			currentSelected = list.length - 1;

		grpList.forEach(function(text:FlxText)
		{
			text.text = list[text.ID];

			if (text.ID == currentSelected)
			{
				text.color = FlxColor.YELLOW;
				text.text = selectedArrow + text.text;
			}
			else
			{
				text.color = FlxColor.WHITE;
			}
		});
	}
}
