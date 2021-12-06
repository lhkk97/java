
public class HankookTire extends Tire {
	
	public HankookTire(String location, int maxRotation) {
		super(location, maxRotation);
	}
	
	@Override
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location+" HankookTire ����: "+
					(maxRotation-pastRotation)+"ȸ");
			return true;
		} else {
			System.out.println("*** "+location+" HankookTire ��ũ ***");
			return false;
		}
	}
}
