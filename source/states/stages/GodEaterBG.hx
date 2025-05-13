package states.stages;

import states.stages.objects.*;

class GodEaterBG extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	override function create()
	{
		Cache.Clear();
		modchart = new ModChart(this);

		switch (SONG.song.toLowerCase())
		{
			case 'god-eater':
				defaultCamZoom = 0.65;
				curStage = 'sky';

				var sky = new FlxSprite(-850, -850);
				sky.frames = Paths.getSparrowAtlas('god_bg');
				sky.animation.addByPrefix('sky', "bg", 30);
				sky.setGraphicSize(Std.int(sky.width * 0.8));
				sky.animation.play('sky');
				sky.scrollFactor.set(0.1, 0.1);
				sky.antialiasing = true;
				add(sky);

				var bgcloud = new FlxSprite(-850, -1250);
				bgcloud.frames = Paths.getSparrowAtlas('god_bg');
				bgcloud.animation.addByPrefix('c', "cloud_smol", 30);
				//bgcloud.setGraphicSize(Std.int(bgcloud.width * 0.8));
				bgcloud.animation.play('c');
				bgcloud.scrollFactor.set(0.3, 0.3);
				bgcloud.antialiasing = true;
				add(bgcloud);

				add(new MansionDebris(300, -800, 'norm', 0.4, 1, 0, 1));
				add(new MansionDebris(600, -300, 'tiny', 0.4, 1.5, 0, 1));
				add(new MansionDebris(-150, -400, 'spike', 0.4, 1.1, 0, 1));
				add(new MansionDebris(-750, -850, 'small', 0.4, 1.5, 0, 1));

				/*
				add(new MansionDebris(-300, -1700, 'norm', 0.5, 1, 0, 1));
				add(new MansionDebris(-600, -1100, 'tiny', 0.5, 1.5, 0, 1));
				add(new MansionDebris(900, -1850, 'spike', 0.5, 1.2, 0, 1));
				add(new MansionDebris(1500, -1300, 'small', 0.5, 1.5, 0, 1));
				*/

				add(new MansionDebris(-300, -1700, 'norm', 0.75, 1, 0, 1));
				add(new MansionDebris(-1000, -1750, 'rect', 0.75, 2, 0, 1));
				add(new MansionDebris(-600, -1100, 'tiny', 0.75, 1.5, 0, 1));
				add(new MansionDebris(900, -1850, 'spike', 0.75, 1.2, 0, 1));
				add(new MansionDebris(1500, -1300, 'small', 0.75, 1.5, 0, 1));
				add(new MansionDebris(-600, -800, 'spike', 0.75, 1.3, 0, 1));
				add(new MansionDebris(-1000, -900, 'small', 0.75, 1.7, 0, 1));

				var fgcloud = new FlxSprite(-1150, -2900);
				fgcloud.frames = Paths.getSparrowAtlas('god_bg');
				fgcloud.animation.addByPrefix('c', "cloud_big", 30);
				//bgcloud.setGraphicSize(Std.int(bgcloud.width * 0.8));
				fgcloud.animation.play('c');
				fgcloud.scrollFactor.set(0.9, 0.9);
				fgcloud.antialiasing = true;
				add(fgcloud);

				var bg:FlxSprite = new FlxSprite(-400, -160).loadGraphic(Paths.image('bg_lemon'));
				bg.setGraphicSize(Std.int(bg.width * 1.5));
				bg.antialiasing = true;
				bg.scrollFactor.set(0.95, 0.95);
				bg.active = false;
				add(bg);

				var techo = new FlxSprite(0, -20);
				techo.frames = Paths.getSparrowAtlas('god_bg');
				techo.animation.addByPrefix('r', "broken_techo", 30);
				techo.setGraphicSize(Std.int(techo.frameWidth * 1.5));
				techo.animation.play('r');
				techo.scrollFactor.set(0.95, 0.95);
				techo.antialiasing = true;
				add(techo);

				gf_rock = new FlxSprite(20, 20);
				gf_rock.frames = Paths.getSparrowAtlas('god_bg');
				gf_rock.animation.addByPrefix('rock', "gf_rock", 30);
				gf_rock.animation.play('rock');
				gf_rock.scrollFactor.set(0.8, 0.8);
				gf_rock.antialiasing = true;
				add(gf_rock);

				rock = new FlxSprite(20, 20);
				rock.frames = Paths.getSparrowAtlas('god_bg');
				rock.animation.addByPrefix('rock', "rock", 30);
				rock.animation.play('rock');
				rock.scrollFactor.set(1, 1);
				rock.antialiasing = true;
				add(rock);
		}
	}
	public function godIntro() // STOLEN STRAIGHT FROM https://github.com/GithubSPerez/the-shaggy-mod/blob/main/source/PlayState.hx
	{
		dad.playAnim('back', true);
		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			dad.playAnim('snap', true);
			new FlxTimer().start(0.85, function(tmr2:FlxTimer)
			{
				FlxG.sound.play(Paths.sound('snap'));
				FlxG.sound.play(Paths.sound('undSnap'));
				sShake = 10;
				new FlxTimer().start(0.06, function(tmr3:FlxTimer)
				{
					dad.playAnim('snapped', true);
				});
				new FlxTimer().start(1.5, function(tmr4:FlxTimer)
				{
					new FlxTimer().start(0.001, function(shkUp:FlxTimer)
					{
						sShake += 0.51;
						if (!godCutEnd) shkUp.reset(0.001);
					});
					new FlxTimer().start(1, function(tmr5:FlxTimer)
					{
						add(new MansionDebris(-300, -120, 'ceil', 1, 1, -4, -40));
						add(new MansionDebris(0, -120, 'ceil', 1, 1, -4, -5));
						add(new MansionDebris(200, -120, 'ceil', 1, 1, -4, 40));

						sShake += 5;
						FlxG.sound.play(Paths.sound('ascend'));
						godCutEnd = true;
						new FlxTimer().start(0.4, function(tmr6:FlxTimer)
						{
							godMoveGf = true;
						});
						new FlxTimer().start(1, function(tmr9:FlxTimer)
						{
							boyfriend.playAnim('scared', true);
						});
						new FlxTimer().start(2, function(tmr7:FlxTimer)
						{
							dad.playAnim('idle', true);
							FlxG.sound.play(Paths.sound('shagFly'));
							godMoveSh = true;
							new FlxTimer().start(1.5, function(tmr8:FlxTimer)
							{
								startCountdown();
							});
						});
					});
				});
			});
		});
		new FlxTimer().start(0.001, function(shk:FlxTimer)
		{
			if (sShake > 0)
			{
				sShake -= 0.5;
				FlxG.camera.angle = FlxG.random.float(-sShake, sShake);
			}
			shk.reset(0.001);
		});
	}

	var gf_launched:Bool = false;
	public static var skipIntro=false;
  }	// ADAPTED FROM QUAVER!!!
	// COOL GUYS FOR OPEN SOURCING
	// https://github.com/Quaver/Quaver
	// https://github.com/Quaver/Quaver
	// https://github.com/Quaver/Quaver
	var sShake:Float = 0;

	override public function update(elapsed:Float)
	{
		#if !debug
		perfectMode = false;
		#end
		updatePositions();
		if(vcrDistortionHUD!=null){
			vcrDistortionHUD.update(elapsed);
			vcrDistortionGame.update(elapsed);
		}
		if(rainShader!=null){
			rainShader.update(elapsed);
		}
		modchart.update(elapsed);

		if (FlxG.keys.justPressed.NINE)
		{
			if (iconP1.animation.curAnim.name == 'bf-old')
				iconP1.animation.play(SONG.player1);
			else
				iconP1.animation.play('bf-old');
		}

		switch (curStage)
		{
			case 'philly':
				if (trainMoving)
				{
					trainFrameTiming += elapsed;

					if (trainFrameTiming >= 1 / 24)
					{
						updateTrainPos();
						trainFrameTiming = 0;
					}
				}
				//phillyCityLights.members[curLight].alpha -= (Conductor.crochet / 1000) * FlxG.elapsed * 1.5;
				if(currentOptions.picoShaders && lightFadeShader!=null)
					lightFadeShader.addAlpha((Conductor.crochet / 1000) * FlxG.elapsed * 1.5);
				else
					phillyCityLights.members[curLight].alpha -= (Conductor.crochet / 1000) * FlxG.elapsed * 1.5;
			case 'sky':
				var rotRate = curStep * 0.25;
				var rotRateSh = curStep / 9.5;
				var rotRateGf = curStep / 9.5 / 4;
				var derp = 12;
				if (!startedCountdown)
				{
					camFollow.x = boyfriend.x - 300;
					camFollow.y = boyfriend.y - 40;
					derp = 20;
				}
				if (godCutEnd)
					{

						var bf_toy = -2000 + Math.sin(rotRate) * 20;

						var sh_toy = -2450 + -Math.sin((rotRateSh * 2) * sh_s) * sh_r * 0.45;
						var sh_tox = -330 -Math.cos(rotRateSh* sh_s) * sh_r;

						if(dad.curCharacter=='shaggypowerup'){
							sh_toy -=160;
							sh_tox -=200;
						}else if (dad.curCharacter=='ui_shaggy'){
							sh_toy -=120;
							sh_tox -=160;
						}
						var gf_tox = 100 + Math.sin(rotRateGf) * 200;
						var gf_toy = -2000 -Math.sin(rotRateGf) * 80;

						if (godMoveBf)
						{
							boyfriend.y += (bf_toy - boyfriend.y) / derp;
							rock.x = boyfriend.x - 200;
							rock.y = boyfriend.y + 200;
							if(SONG.player1=='bf-neb')
								rock.y += 75;
							rock.alpha = 1;
						}

						if (godMoveSh)
						{
							dad.x += (sh_tox - dad.x) / 12;
							dad.y += (sh_toy - dad.y) / 12;
						}


						if (godMoveGf)
						{
							gf.x += (gf_tox - gf.x) / derp;
							gf.y += (gf_toy - gf.y) / derp;

							gf_rock.x = gf.x + 80;
							gf_rock.y = gf.y + 530;
							gf_rock.alpha = 1;
							if (!gf_launched)
							{
								gf.scrollFactor.set(0.8, 0.8);
								gf.setGraphicSize(Std.int(gf.width * 0.8));
								gf_launched = true;
							}
						}
					}
					if (!godCutEnd || !godMoveBf)
					{
						rock.alpha = 0;
					}
					if (!godMoveGf)
					{
						gf_rock.alpha = 0;
					}
		}
	}
}
