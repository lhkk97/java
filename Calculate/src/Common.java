import java.util.ArrayList;

public class Common {
	// 1.�� ��(X,Y) �� ���� ���� ã�´�.
	// 2.�ݺ����� �����ϸ鼭, 2~X-1���� X�� Y�� ��������.
	// 2~X-1������ �ѹ��� �������� ������ 6������ ����.
	// 3.X�� Y�� A�� ���ÿ� ��������(�������� 0�̸�) A�� ���� ����
	// 4.�� ���� ���� X�� Y�� ��ü�Ѵ�.
	// 5.1�� ���ư���
	// 6.A�� ���� ������ ���� �� -> �ִ�����
	// 7.X*Y/�ִ����� -> �ּҰ����
	// 8.���
	int X,Y,N,A;
	int mul;
	Common() {}
	Common(int X, int Y){
		this.X=X;
		this.Y=Y;
		this.mul=X*Y;
	}
	void find2Number() {
		N=(X>Y)?Y:X;
	}
	void showGCF() {
		this.find2Number();
		this.A=1;
		for(int i=2; i<N-1; i++) {
			if(X%i==0 && Y%i==0) {	
				this.X=X/i;
				this.Y=Y/i;
				this.A*=i;
			}
		}
		System.out.println("�ִ�����: "+this.A);	
	}
	void showLCM() {
		System.out.println("�ּҰ����: "+this.mul/this.A);
	}
	
}

//int x;
//int y;
//int gcf;
//int lcm;
//
//Common(){}
//Common(int x, int y){
//   this.x = x;
//   this.y = y;
//   this.find2Number();
//}
//void find2Number() {
//   for(int i=1; i<x && i<y; i++) {
//      if(x%i==0 && y%i==0) {
//         gcf=i;
//         lcm=(x*y)/gcf;
//         }
//      }
//   }
//
//void showGCF(){
//   System.out.println(x +"��"+ y +"�� �ִ����� : "+ gcf);
//}
//
//void showLCM(){
//   System.out.println(x +"��"+ y +"�� �ּҰ���� : "+ lcm);
//}

