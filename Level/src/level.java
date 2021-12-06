import java.util.Scanner;

public class level {
	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		int p=Integer.parseInt(s.nextLine());
		if(p>=90) {
			if(p>=95) System.out.println("A+");
			else System.out.println("A-");
		}
		else if(p>=80) {
			if(p>=85) System.out.println("B+");
			else System.out.println("B-");
		}
		else if(p>=70) {
			if(p>=75) System.out.println("C+");
			else System.out.println("C-");
		}
		else if(p>=60) {
			if(p>=65) System.out.println("D+");
			else System.out.println("D-");
		}
		else System.out.println("F");
	}
}
