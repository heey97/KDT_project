package dto;

import java.sql.Timestamp;

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
public class NoticeDto {
	private long notice_idx;
	private String title;
	private String contents;
	private int read_cnt;
	private Timestamp crt_date;
	private String att_file;
	private String up_file;
}
