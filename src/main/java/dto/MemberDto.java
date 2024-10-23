package dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@JsonIgnoreProperties(ignoreUnknown = true)

public class MemberDto {
	@Setter
	private String id;
	@Setter
	private String password;
	@Setter
	private String name;
	private String birth;
	private String gender;
	@Setter
	private String phonenum;
	@Setter
	private String email;
	private String add_city;
	private String add_state;
	private String add_dong;
	private String add_details;
	private String postalCode;
	@Setter
	private String favorite;
	private Timestamp reg_date;
	private String att_file;
	private String up_file;
}
