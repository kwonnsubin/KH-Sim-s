package kh.finalproject.sims;

public class Mmm {

	public static void main(String[] args) {
		
		int voice[] = {0, 60, 120, 200, 300, 500, 800, 999999};
		int data[] = {0, 200, 800, 1500, 5000, 100000, 999999};
		int sms[] = {0,	50,	100, 200, 500, 999999};
		int age[] = {20, 18, 65};
		int type[] = {2, 3, 6};
		int dis[] = {0, 12, 24};
		
		int cnt = 0;
		for(int i: voice) {
			for(int j: data) {
				for(int x: sms) {
					for(int y: age) {
						for(int z: type) {
							for(int a: dis) {
								System.out.println(i + " | " + j + " | " + x + " | " + y + " | " + z + " | " + a);
								cnt++;
							}
						}
					}
				}
			}
		}
		System.out.println(cnt);

	}

}
