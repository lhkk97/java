import java.util.ArrayList;

public class Common {
	// 1.두 수(X,Y) 중 작은 수를 찾는다.
	// 2.반복문을 실행하면서, 2~X-1까지 X와 Y를 나눠본다.
	// 2~X-1까지로 한번도 나눠지지 않으면 6번으로 간다.
	// 3.X와 Y가 A로 동시에 나눠지면(나머지가 0이면) A를 따로 보관
	// 4.두 수의 몫을 X와 Y에 대체한다.
	// 5.1로 돌아간다
	// 6.A를 따로 보관한 값의 곱 -> 최대공약수
	// 7.X*Y/최대공약수 -> 최소공배수
	// 8.출력
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
		System.out.println("최대공약수: "+this.A);	
	}
	void showLCM() {
		System.out.println("최소공배수: "+this.mul/this.A);
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
//   System.out.println(x +"와"+ y +"의 최대공약수 : "+ gcf);
//}
//
//void showLCM(){
//   System.out.println(x +"와"+ y +"의 최소공배수 : "+ lcm);
//}

