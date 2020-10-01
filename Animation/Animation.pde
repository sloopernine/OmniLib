// Robin B
class Animation{
	
	PVector position;

	PImage spriteSheet;
	PImage[] spriteAnimation;

	String name;

	int spriteSize;
	int col;
	int row;

	int animationCounter = 0;
	// Default 30, higher value = slower animation
	int animSpeed = 30; 

	boolean playLock = false;
	boolean loopLock = false;

	int lastTime = millis();

	Animation(int rows, int columns, String fileName, int animationSpeed){

		position = new PVector(0, 0);

		spriteSheet = loadImage("data/sprites/" + fileName + ".png");
		spriteAnimation = new PImage[rows * columns];

		// Save name of animation for future features
		name = fileName;
		col = columns;
		row = rows;
		// Default speed 30
		animSpeed = animationSpeed;

		spriteSize = spriteSheet.width / col;

		PrepareAnimation();

		animationManager.Register(this);
	}

	// Iterate through animation from AnimationManager
	void Update(){

		image(spriteAnimation[animationCounter], position.x - (spriteSize / 2), position.y - (spriteSize / 2));

		if(animationCounter < (row * col) - 1){

			if(millis() - lastTime > animSpeed){

				animationCounter++;
				lastTime = millis();
			}
		} else {

			animationCounter = 0;
			playLock = false;
		}
	}

	// Set animation to play once
	void Play(float xPos, float yPos){

		if(playLock == false){

			position = new PVector(xPos, yPos);
			animationCounter = 0;
			playLock = true;
		}
	}

	// Set animation to loop
	void Loop(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		loopLock = true;
	}

	// Set animation to stop
	void Stop(){

		playLock = false;
		loopLock = false;
	}

	// Return if animation still is playing
	boolean isPlaying(){

		boolean returnValue;

		if(playLock == false && loopLock == false){

			returnValue = false;
		} else {

			returnValue = true;
		}

		return returnValue;
	}

	// Cut out all frames from sprite sheet
	void PrepareAnimation(){

		int counter = 0;

		for(int y = 0; y < col; y++){
			for(int x = 0; x < row; x++){

				spriteAnimation[counter] = spriteSheet.get(x * spriteSize, y * spriteSize, spriteSize, spriteSize);

				counter++;
			}
		}
	}
}