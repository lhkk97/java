import java.util.ArrayList;
import java.util.Scanner;

public class Order {
	ArrayList<String> mobile;
	ArrayList<String> name;
	ArrayList<Integer> qty;
	ArrayList<Integer> sum;

	Scanner s;
	Scanner n;

	Order() {
		this.mobile=new ArrayList<String>();
		this.name=new ArrayList<String>();
		this.qty=new ArrayList<Integer>();
		this.sum=new ArrayList<Integer>();
		
		this.s=new Scanner(System.in);
		this.n=new Scanner(System.in);
	}	
	void add(String menu, int qty, int price) {
		this.name.add(menu);
		this.qty.add(qty);
		this.sum.add(price*qty);
	}
	void remove(int ndx) {
		this.mobile.remove(ndx-1);
	    this.name.remove(ndx-1);
	    this.qty.remove(ndx-1);
	    this.sum.remove(ndx-1);
	}
	void update(int ndx, String mobile, String menu, int qty, int price) {
		this.mobile.set(ndx-1,mobile);
	    this.name.set(ndx-1,menu);
	    this.qty.set(ndx-1,qty);
	    this.sum.set(ndx-1,price);
	}
	void display() {
	    for(int i=0;i<this.name.size();i++) {
	    	System.out.println(this.mobile.get(i)+","+this.name.get(i)+" x"+this.qty.get(i)+","+this.sum.get(i));
	    }
	}
	void Handling(Menu menu) {
		String sch=this.getInput(menu);
		
		while(!sch.equals("X")) {
			int ndx=Integer.parseInt(sch);
			System.out.println("선택한 메뉴의 수량을 입력하세요.");
			int qty=this.n.nextInt();
			
			this.add(menu.alMenu.get(ndx-1), qty, menu.alPrice.get(ndx-1));
			this.showOrder();
			
			sch=this.getInput(menu);		
		}
		int start_ndx=this.addMobile();
		
		
		int total=0;
		for(int i=start_ndx;i<this.name.size();i++) {
			System.out.println(this.mobile.get(i)+","+this.name.get(i)+" x"+this.qty.get(i)+","+this.sum.get(i));
			total+=this.sum.get(i);
		}
		System.out.println("총주문금액 "+total);
		System.out.println("----------------------------------------");
	}
	
	void showOrder() {
		int n=this.name.size()-1;
		System.out.println(this.name.get(n)+" x"+this.qty.get(n)+","+this.sum.get(n));
	}
	String getInput(Menu m) {
		m.display();
		System.out.println("주문할 메뉴번호를 입력하세요(X:주문종료)");
		return this.s.nextLine();
	}
	int addMobile() {
		System.out.println("주문고객의 모바일번호를 입력하세요");
		String mobile=this.s.nextLine();
		
		int start_ndx=this.mobile.size();
		
		for(int i=start_ndx; i<this.name.size();i++) {
			if(mobile.equals("")) {
				this.mobile.add("-");
			} else {
				this.mobile.add(mobile);
			}
		} 
		return start_ndx;
	}
}
		
		  
		
		

