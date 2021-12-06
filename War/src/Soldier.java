
public class Soldier {
	private int AP; // �ִ���ݷ�
	private int HP;

	public Soldier() {}
	public Soldier(int AP, int HP) {
		this.AP = AP;
	    this.HP = HP;
	}
	public int getAP() {
		return AP;
	}
	public void setAP(int AP) {
		this.AP = AP;
	}
	public int getHP() {
	    return HP;
	}
	public void setHP(int AP) {
		this.HP-=AP;
	    System.out.println("���� ���� ü��: "+this.HP);
	}
	public void attack(Warrior w) {
		int attackPoint=(int)(Math.random()*this.AP);
	    System.out.println("���� ���ݷ�: "+attackPoint);
	    w.setHP(attackPoint);
	}
}
