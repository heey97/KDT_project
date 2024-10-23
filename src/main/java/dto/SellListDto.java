package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SellListDto {
	private String pdt_code;
	private String sell_id;
	private String category;
	private int price;
	private int read_cnt;
	private int like_cnt;
	private String title;
	private String contents;
	private String sell_location;
	private String sell_stt;
	private Timestamp sell_date;
	private String att_file;
	private String up_file;
	private int comment_cnt;
	private int rownum;
}
