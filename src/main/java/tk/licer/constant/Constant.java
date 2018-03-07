package tk.licer.constant;

/**
 * 
 * @author Administrator
 * 
 */
public class Constant {

	public enum Order {

		/** 升序 */
		ASC {
			public String getName() {
				return "升序";
			}
		},
		/** 降序 */
		DESC {
			public String getName() {
				return "降序";
			}
		};

		public abstract String getName();
	}

	
	
	
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {

		System.out.println(Order.ASC);

	}
}
