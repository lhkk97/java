
public class KumhoTire extends Tire {

	public KumhoTire(String location, int maxRotation) {
		super(location, maxRotation);
	}

	@Override
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location+" KumhokTire ����: "+
					(maxRotation-pastRotation)+"ȸ");
			return true;
		} else {
			System.out.println("*** "+location+" KumhoTire ��ũ ***");
			return false;
		}
	}
}
