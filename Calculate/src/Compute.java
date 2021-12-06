
public class Compute {

	public static void main(String[] args) {
		Common cmn=new Common(12,18);
		cmn.showGCF();  // 최대공약수
		cmn.showLCM();  // 최소공배수
		
		Common cmn2=new Common(104,128);		
		cmn2.showGCF();  // 최대공약수
		cmn2.showLCM();  // 최소공배수
	}
}
