
public class InheritanceSample {

	public static void main(String[] args) {
		Car car = new Car();
		
		for(int i=1; i<=5; i++) {
			int punk = car.run();
			switch(punk) {
			case 1:
				System.out.println("�տ��� HankookTire�� ��ü");
				car.tires[punk-1] = new HankookTire("�տ���",15);
				break;
			case 2:
				System.out.println("�տ����� KumhoTire�� ��ü");
				car.tires[punk-1] = new KumhoTire("�տ���",15);
				break;
			case 3:
				System.out.println("�ڿ��� HankookTire�� ��ü");
				car.tires[punk-1] = new HankookTire("�տ���",15);
				break;
			case 4:
				System.out.println("�ڿ����� KumhoTire�� ��ü");
				car.tires[punk-1] = new KumhoTire("�տ���",15);
				break;
			}
			System.out.println("------------------------------");
		}
	}

}
