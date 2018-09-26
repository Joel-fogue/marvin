//import java.util.Scanner;

public class SieveOfEratosthenes {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		sieveOfEratosthenes(100);
	}

	public static void sieveOfEratosthenes(int n) {
		boolean primeNumbers[] = new boolean[n + 1];
		for (int i = 0; i < n; i++)
			primeNumbers[i] = true;

		for (int p = 2; p * p <= n; p++) {
			if (primeNumbers[p] == true) {
				for (int i = p * 2; i <= n; i += p)
					primeNumbers[i] = false;
			}
		}

		for (int i = 2; i <= n; i++) {
			if (primeNumbers[i] == true)
				System.out.print(i + " ");
		}
	}
}
