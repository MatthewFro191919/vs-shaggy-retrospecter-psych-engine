package objects;

import objects.Character;

class HealthIcon extends FlxSprite
{
	public var dad:Character = null;
        public var gf:Character = null;
	public var boyfriend:Character = null;

	public var sprTracker:FlxSprite;
	private var isPlayer:Bool = false;
	private var char:String = '';
	var kadecharacters:Array<String> = ['bf','baby','homer','freddy','scout','miku','pewdiepie','tinky','monstershit','running-goblin','evil-baby','gametoons','screamer','alien','bob','player-baby','bob-ron','ron','bobcreature','bobdead','bf-baby','bf-baby-goblin','happy-baby','kitty','myth','window-watcher','glassgoblin','glassbaby',];

	public function new(char:String = 'face', isPlayer:Bool = false, ?allowGPU:Bool = true)
	{
		super();
		this.isPlayer = isPlayer;
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 12, sprTracker.y - 30);
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String, ?allowGPU:Bool = true) {
		if(this.char != char) {
				loadGraphic(Paths.image('gameshit/iconGrid'), true, 150, 150);

		if(char=='shaggy' || char=='ui_shaggy' || char=='shaggypowerup'){
			loadGraphic(Paths.image('shageee'), true, 150, 150);
			antialiasing=true;
			animation.add('shaggy', [0, 1], 0, false);
			animation.add('ui_shaggy', [2,3], 0, false);
			animation.add('shaggypowerup', [2,3], 0, false);
			animation.play(char);
		}else{
			loadGraphic(Paths.image('iconGrid'), true, 150, 150);
			antialiasing=true;
			animation.add('bf', [0, 1], 0, false);
			animation.add('bf-car', [0, 1], 0, false);
			animation.add('bf-christmas', [0, 1], 0, false);
			animation.add('spooky', [2, 3], 0, false);
			animation.add('pico', [4, 5], 0, false);
			animation.add('mom', [6, 7], 0, false);
			animation.add('mom-car', [6, 7], 0, false);
			animation.add('tankman', [8, 9], 0, false);
			animation.add('face', [10, 11], 0, false);
			animation.add('dad', [12, 13], 0, false);
			animation.add('bf-old', [14, 15], 0, false);
			animation.add('gf', [16], 0, false);
			animation.add('lizzy', [16], 0, false);
			animation.add('parents-christmas', [17], 0, false);
			animation.add('monster', [19, 20], 0, false);
			animation.add('monster-christmas', [19, 20], 0, false);
			animation.add('bf-pixel', [21, 21], 0, false);
			animation.add('senpai', [22, 22], 0, false);
			animation.add('senpai-angry', [22, 22], 0, false);
			animation.add('spirit', [23, 23], 0, false);
			animation.add('bf-neb', [24,25], 0, false);
			if(animation.getByName(char)!=null)
				animation.play(char);
			else
				animation.play("face");
		}
	}

	public var autoAdjustOffset:Bool = true;
	override function updateHitbox()
	{
		super.updateHitbox();
		if(autoAdjustOffset)
		{
			offset.x = iconOffsets[0];
			offset.y = iconOffsets[1];
		}
	}

	public function getCharacter():String {
		return char;
	}
}
