
public class InheritanceSample {

	public static void main(String[] args) {
		Car car = new Car();
		
		for(int i=1; i<=5; i++) {
			int punk = car.run();
			switch(punk) {
			case 1:
				System.out.println("앞왼쪽 HankookTire로 교체");
				car.tires[punk-1] = new HankookTire("앞왼쪽",15);
				break;
			case 2:
				System.out.println("앞오른쪽 KumhoTire로 교체");
				car.tires[punk-1] = new KumhoTire("앞왼쪽",15);
				break;
			case 3:
				System.out.println("뒤왼쪽 HankookTire로 교체");
				car.tires[punk-1] = new HankookTire("앞왼쪽",15);
				break;
			case 4:
				System.out.println("뒤오른쪽 KumhoTire로 교체");
				car.tires[punk-1] = new KumhoTire("앞왼쪽",15);
				break;
			}
			System.out.println("------------------------------");
		}
	}

}
