package uit.model;

import java.util.TreeMap;

public class Cart {
	private TreeMap<Product, Integer> list;
	private long cartID;

	public Cart() {
		list = new TreeMap<>();
		cartID = System.currentTimeMillis();
	}

	public Cart(TreeMap<Product, Integer> list, long cartID) {
		this.list = list;
		this.cartID = cartID;
	}

	public TreeMap<Product, Integer> getList() {
		return list;
	}

	public void setList(TreeMap<Product, Integer> list) {
		this.list = list;
	}

	public long getCartID() {
		return cartID;
	}

	public void setCartID(long cartID) {
		this.cartID = cartID;
	}

	public void insertToCart(Product pr, int quantity) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			int sl = list.get(pr);
			quantity += sl;
			list.put(pr, quantity);
		} else {
			list.put(pr, quantity);
		}
	}

	public void subToCart(Product pr, int quantity) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			int sl = list.get(pr);
			quantity = sl - quantity;
			if (quantity <= 0) {
				list.remove(pr);
			} else {
				list.remove(pr);
				list.put(pr, quantity);
			}
		}
	}

	public void removeToCart(Product pr) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			list.remove(pr);
		}
	}
	
	public void clear() {
		list.clear();
	}
}
