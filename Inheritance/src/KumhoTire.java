
public class KumhoTire extends Tire {

	public KumhoTire(String location, int maxRotation) {
		super(location, maxRotation);
	}

	@Override
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location+" KumhokTire ¼ö¸í: "+
					(maxRotation-pastRotation)+"È¸");
			return true;
		} else {
			System.out.println("*** "+location+" KumhoTire ÆãÅ© ***");
			return false;
		}
	}
}
