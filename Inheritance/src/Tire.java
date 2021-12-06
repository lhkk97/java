
public class Tire {
	int maxRotation;
	int pastRotation;
	String location;
	
	public Tire() {}
	public Tire(String location, int maxRotation) {
		this.location = location;
		this.maxRotation = maxRotation;
	}
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location+"Tire ����: "+
					(maxRotation-pastRotation)+"ȸ");
			return true;
		} else {
			System.out.println("*** "+location+" Tire ��ũ ***");
			return false;
		}
	}
}
