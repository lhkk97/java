import java.util.ArrayList;
import java.util.Scanner;

public class HelloWorld {
	public static void main(String[] args) {
		ArrayList<String> alMenu=new ArrayList<String>();
		ArrayList<Integer> alPrice=new ArrayList<Integer>();
		
		alMenu.add("Americano"); alPrice.add(2000);
		alMenu.add("Latte"); alPrice.add(3000);
		alMenu.add("Mocca"); alPrice.add(3500);
		alMenu.add("Expresso"); alPrice.add(2500);
		alMenu.add("Cappuccino"); alPrice.add(4000);
		
		for(int i=0;i<alMenu.size();i++) {
			System.out.println(alMenu.get(i)+","+alPrice.get(i));
		}
	}
}