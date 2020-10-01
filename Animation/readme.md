#Animation


**HOW TO**
- Add this to your main file
```Processing
AnimationManager animationManager;

void setup(){

  animationManager = new AnimationManager();
}

void draw(){

    animationManager.Update();
}
```
- Add this in the file where you want to add animation
```Processing
class MyClass{

	Animation animation;

	MyClass(){

		// Currently only accept .PNG files.
		// Larger value on animation speed, plays animation slower
		animation = new Animation(int rows,int columns, "filename without extension", float animation speed);
	}

	void Loop(){

		animation.Loop(position.x, position.y);
	}

	void SingleCall(){

		// Returns if animation still running.
		boolean = animation.isPlaying();

		animation.Play(position.x, position.y);
		animation.Stop();
	}
}
```