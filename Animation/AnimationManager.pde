// Robin B
class AnimationManager{
	
	int arraySize = 200;

	Animation[] animations;

	AnimationManager(){

		animations = new Animation[arraySize];
	}

	void Update(){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				continue;
			} else {

				if(animations[i].playLock || animations[i].loopLock){

					animations[i].Update();
				}
			}
		}
	}

	// Add animation to the array
	int Register(Animation anim){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				animations[i] = anim;
				// Returns index number if wanted
				return i;
			}
		}

		// If no free slot found
		return -1;
	}

	void Unregister(Animation anim){

		for (int i = 0; i < animations.length; i++){
			if (animations[i] == null){
				
				continue;
			} else {

				//DO SOMETHING HERE
			}
		}
	}
}