package projects.beans;

public enum OrderStatus {
	DESC(0), INCR(1),;

	private int value;

	OrderStatus(int value) {
		this.setValue(value);
	}

	public static OrderStatus getOrderStatusFromInt(int value) {
		switch (value) {
		case 0:
			return OrderStatus.INCR;
		case 1:
			return OrderStatus.DESC;
		}
		return null;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
}
