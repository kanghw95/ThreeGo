package threego.model.vo;

public class Parking {
	private int parking_code;
	private String parking_name;
	private String addr;
	private String parking_type;
	private String parking_type_nm;
	private char operation_rule;
	private String operation_rule_nm;
	private String tel;
	private int capacity;
	private char pay_yn;
	private String pay_nm;
	private char night_free_open;
	private String night_free_open_nm;
	private String weekday_begin_time;
	private String weekday_end_time;
	private String weekend_begin_time;
	private String holiday_begin_time;
	private String holiday_end_time;
	private String sync_time;
	private char saturday_pay_yn;
	private String saturday_pay_nm;
	private char holiday_pay_yn;
	private String holiday_pay_nm;
	private String fulltime_monthly;
	private int rates;
	private int time_rate;
	private int add_rates;
	private int add_time_rate;
	private int day_maximum;
	private float lat;
	private float lng;
	private float grade;
	public Parking() {}
	public int getParking_code() {
		return parking_code;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public void setParking_code(int parking_code) {
		this.parking_code = parking_code;
	}
	public String getParking_name() {
		return parking_name;
	}
	public void setParking_name(String parking_name) {
		this.parking_name = parking_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getParking_type() {
		return parking_type;
	}
	public void setParking_type(String parking_type) {
		this.parking_type = parking_type;
	}
	public String getParking_type_nm() {
		return parking_type_nm;
	}
	public void setParking_type_nm(String parking_type_nm) {
		this.parking_type_nm = parking_type_nm;
	}
	public char getOperation_rule() {
		return operation_rule;
	}
	public void setOperation_rule(char operation_rule) {
		this.operation_rule = operation_rule;
	}
	public String getOperation_rule_nm() {
		return operation_rule_nm;
	}
	public void setOperation_rule_nm(String operation_rule_nm) {
		this.operation_rule_nm = operation_rule_nm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public char getPay_yn() {
		return pay_yn;
	}
	public void setPay_yn(char pay_yn) {
		this.pay_yn = pay_yn;
	}
	public String getPay_nm() {
		return pay_nm;
	}
	public void setPay_nm(String pay_nm) {
		this.pay_nm = pay_nm;
	}
	public char getNight_free_open() {
		return night_free_open;
	}
	public void setNight_free_open(char night_free_open) {
		this.night_free_open = night_free_open;
	}
	public String getNight_free_open_nm() {
		return night_free_open_nm;
	}
	public void setNight_free_open_nm(String night_free_open_nm) {
		this.night_free_open_nm = night_free_open_nm;
	}
	public String getWeekday_begin_time() {
		return weekday_begin_time;
	}
	public void setWeekday_begin_time(String weekday_begin_time) {
		this.weekday_begin_time = weekday_begin_time;
	}
	public String getWeekday_end_time() {
		return weekday_end_time;
	}
	public void setWeekday_end_time(String weekday_end_time) {
		this.weekday_end_time = weekday_end_time;
	}
	public String getWeekend_begin_time() {
		return weekend_begin_time;
	}
	public void setWeekend_begin_time(String weekend_begin_time) {
		this.weekend_begin_time = weekend_begin_time;
	}
	public String getHoliday_begin_time() {
		return holiday_begin_time;
	}
	public void setHoliday_begin_time(String holiday_begin_time) {
		this.holiday_begin_time = holiday_begin_time;
	}
	public String getHoliday_end_time() {
		return holiday_end_time;
	}
	public void setHoliday_end_time(String holiday_end_time) {
		this.holiday_end_time = holiday_end_time;
	}
	public String getSync_time() {
		return sync_time;
	}
	public void setSync_time(String sync_time) {
		this.sync_time = sync_time;
	}
	public char getSaturday_pay_yn() {
		return saturday_pay_yn;
	}
	public void setSaturday_pay_yn(char saturday_pay_yn) {
		this.saturday_pay_yn = saturday_pay_yn;
	}
	public String getSaturday_pay_nm() {
		return saturday_pay_nm;
	}
	public void setSaturday_pay_nm(String saturday_pay_nm) {
		this.saturday_pay_nm = saturday_pay_nm;
	}
	public char getHoliday_pay_yn() {
		return holiday_pay_yn;
	}
	public void setHoliday_pay_yn(char holiday_pay_yn) {
		this.holiday_pay_yn = holiday_pay_yn;
	}
	public String getHoliday_pay_nm() {
		return holiday_pay_nm;
	}
	public void setHoliday_pay_nm(String holiday_pay_nm) {
		this.holiday_pay_nm = holiday_pay_nm;
	}
	public String getFulltime_monthly() {
		return fulltime_monthly;
	}
	public void setFulltime_monthly(String fulltime_monthly) {
		this.fulltime_monthly = fulltime_monthly;
	}
	public int getRates() {
		return rates;
	}
	public void setRates(int rates) {
		this.rates = rates;
	}
	public int getTime_rate() {
		return time_rate;
	}
	public void setTime_rate(int time_rate) {
		this.time_rate = time_rate;
	}
	public int getAdd_rates() {
		return add_rates;
	}
	public void setAdd_rates(int add_rates) {
		this.add_rates = add_rates;
	}
	public int getAdd_time_rate() {
		return add_time_rate;
	}
	public void setAdd_time_rate(int add_time_rate) {
		this.add_time_rate = add_time_rate;
	}
	public int getDay_maximum() {
		return day_maximum;
	}
	public void setDay_maximum(int day_maximum) {
		this.day_maximum = day_maximum;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	
	
	
}
