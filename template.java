import java.util.*;
import java.io.*;

public class #CLASS# {
    static MyScanner sc;
    static PrintWriter out;
    static {
        sc = new MyScanner();
        out = new PrintWriter(System.out);
    }
    public static void solve() {
        char[] a = sc.next().toCharArray();
        int l = a.length / 2;
        for(int i = 1; i <= l; i++) {
            int x = 2 * i - 1 - 1;
            int y = 2 * i - 1;
            char c = a[x];
            a[x] = a[y];
            a[y] = c;
        }
        out.println(new String(a));
    }
    public static void main(String[] args) {
        int t = #TESTS#;
        while(t-- > 0)
            solve();
        out.flush();
    }
}

class MyScanner {
    BufferedReader br;
    StringTokenizer tok;
    MyScanner() {
        try { br = new BufferedReader(new InputStreamReader(System.in)); }
        catch(Exception e) { System.out.println(e); }
        tok = new StringTokenizer("");
    }
    public String next() {
        try {
            while(!tok.hasMoreTokens()) tok = new StringTokenizer(br.readLine());
        }
        catch(Exception e) { System.out.println(e); }
        return tok.nextToken();
    }
    public int nextInt() {
        return Integer.parseInt(next());
    }
    public long nextLong() {
        return Long.parseLong(next());
    }
    public double nextDouble() {
        return Double.parseDouble(next());
    }
}

