import java.util.Scanner;

public class CafeControl {

	public static void main(String[] args) {
		Menu menu=new Menu();
		Order order=new Order();
		
		System.out.println("���α׷� ����");
		System.out.println("�۾��� �����Ͻÿ�.(X:����,M:�޴�����,O:�ֹ�����,S:��������)");
		Scanner s=new Scanner(System.in);
		String str=s.nextLine();
		while(!str.equals("X")) {
			if(str.equals("M")) {
				menu.Handling();
			} else if(str.equals("O")) {
				order.Handling(menu);
			} else if(str.equals("S")) {
				System.out.println("��������");
			} 
			System.out.println("�۾��� �����Ͻÿ�.(X:����,M:�޴�����,O:�ֹ�����,S:��������)");
			str=s.nextLine();
		}
		s.close();
		System.out.println("���α׷� ����");
	}
	
}