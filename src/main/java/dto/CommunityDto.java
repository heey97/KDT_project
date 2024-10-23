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
public class CommunityDto {
	//필드,객체의 프로퍼티
	private long community_idx;
	private String writer_id;
	private String title;
	private String contents;
	private int read_cnt;
	private int comment_cnt;
	private Timestamp crt_date;
	private String att_file;
	private String up_file;
}
