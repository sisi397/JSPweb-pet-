package hospital;

public class Hospital {
	private String category;
	private String region;
	private String address;
	private String name;
	private String phone;
		
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getRegion() {
			return region;
		}
		public void setRegion(String region) {
			this.region = region;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		public Hospital() {
			
		}
		
		public Hospital(String category, String region, String address, String name, String phone) {
			super();
			this.category = category;
			this.region = region;
			this.address = address;
			this.name = name;
			this.phone = phone;
		}
		
	
}
