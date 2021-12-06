import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Menu {
	ArrayList<String> alMenu;
	ArrayList<Integer> alPrice;
	
	Scanner s;
	Scanner n;

	Menu() {
		this.alMenu=new ArrayList<String>();
		this.alPrice=new ArrayList<Integer>();
		
		File f=new File("C:\\temp\\menu.txt");
		try {
			FileReader fr=new FileReader(f);
			BufferedReader br=new BufferedReader(fr);
			try {
				String line=br.readLine();
				while(line!=null) {
					String[] ar=line.split(",");
					this.alMenu.add(ar[0]);
					this.alPrice.add(Integer.parseInt(ar[1]));
					line=br.readLine();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	void display() {
		for(int i=0;i<this.alMenu.size();i++) {
			 System.out.println((i+1)+"."+this.alMenu.get(i)+","+this.alPrice.get(i));
		}
	}

	void guide() {
		System.out.println("메뉴관리(X:종료,C:메뉴추가,U:메뉴수정,D:메뉴삭제)");
	}
	
	void add(String menu, int price) {
		this.alMenu.add(menu);
	    this.alPrice.add(price);
	    this.saveMenu();
	}
	void Update(int menu_num, String menu, int price) {
		this.alMenu.set(menu_num-1,menu);
	    this.alPrice.set(menu_num-1,price);
	    this.saveMenu();
	}
	void remove(int menu_num) {
		this.alMenu.remove(menu_num-1);
		this.alPrice.remove(menu_num-1);
		this.saveMenu();
	}
	private void saveMenu() {
		File f=new File("C:\\temp\\menu.txt");
	    try {
	    	FileWriter fw=new FileWriter(f);
	        PrintWriter pw=new PrintWriter(fw);
	        for(int i=0;i<this.alMenu.size();i++) {
	        	pw.print(this.alMenu.get(i)+","+this.alPrice.get(i)+"\n");
	        }
	        pw.close();
	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
	}
	void Handling() {
		this.display();
		this.guide();
	    s= new Scanner(System.in);
	    n= new Scanner(System.in);
	    String sch=s.nextLine();
	    while(!sch.equals("X")) {
	    	if(sch.equals("C")) {
	    		System.out.println("메뉴추가");
	            System.out.println("새 메뉴명을 입력하세요.");
	            String smenu=n.nextLine();
	              
	            System.out.println("새 가격을 입력하세요.");
	            int sprice=Integer.parseInt(n.nextLine());
	              
	            this.add(smenu, sprice);
	    	} else if(sch.equals("U")) {
	    		System.out.println("메뉴수정");
	            System.out.println("수정할 메뉴번호를 입력하세요");
	            int num=Integer.parseInt(n.nextLine());
	              
	            System.out.println("새 메뉴명을 입력하세요");
	            String umenu=n.nextLine();
	              
	            System.out.println("새 가격을 입력하세요");
	            int uprice=Integer.parseInt(n.nextLine());
	          
	            this.Update(num, umenu, uprice);
	    	} else if(sch.equals("D")) {
	    		System.out.println("메뉴삭제");
	            System.out.println("삭제할 메뉴번호를 입력하세요");
	            int num2=Integer.parseInt(n.nextLine());
	            this.remove(num2);
	        }
	        this.display();
	        this.guide();
	        sch=s.nextLine();
	    }
	}
}
