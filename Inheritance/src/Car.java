
public class Car {
	Tire[] tires = {
			new Tire("앞왼쪽",6),
			new Tire("앞오른쪽",2),
			new Tire("뒤왼쪽",3),
			new Tire("뒤오른쪽",4),
	};
//	Tire frontLeft;
//	Tire frontRight;
//	Tire backLeft;
//	Tire backRight;
	
	public Car() {
		
//		frontLeft = new Tire("앞왼쪽",6);
//		frontRight = new Tire("앞오른쪽",2);
//		backLeft = new Tire("뒤왼쪽",3);
//		backRight = new Tire("뒤오른쪽",4);
	}
	int run() {
		System.out.println("자동차가 달립니다.");
		for(int i=0; i<tires.length; i++) {
			if(!tires[i].roll()) {stop(); return i+1;}
		}
//		if(!frontLeft.roll()) {stop(); return 1;}
//		if(!frontRight.roll()) {stop(); return 2;}
//		if(!backLeft.roll()) {stop(); return 3;}
//		if(!backRight.roll()) {stop(); return 4;}
		return 0;
	}
	
	void stop() {
		System.out.println("자동차가 멈춥니다.");
	}
}
