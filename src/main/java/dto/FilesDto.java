package dto;


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
public class FilesDto{
	private int file_idx;
	private String member_id;
	private String sell_pcode;
	private int notice_idx;
	private int community_idx;
	private String att_file;
	private String up_file; 
}