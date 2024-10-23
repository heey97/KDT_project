package dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BuyListDto{
	private String buy_code;
	private String pdt_code;
	@Setter
	private String sell_id;
	private int price;
	private String title;
	private String pay_id; 
	private String pay_type;
	private String pay_key;
	@JsonFormat(shape = Shape.STRING,pattern = "yyyy-MM-dd'T'HH:mm:ssXXX")
	private Timestamp pay_date;
}

enum PayType {
	Kakao, Toss
}