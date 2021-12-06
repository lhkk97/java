
public class Prime {
	public static void main(String[] args) {
		int total=0;
		for(int i=0; i<args.length; i++) {
			total=total+Integer.parseInt(args[i]);
			System.out.println("현재값: "+args[i]);
		}
		System.out.println("합계: "+total);
	}	
}
