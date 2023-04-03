package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RoomVO {
	private String roomCode;
	private String buildingCode;
	private int roomFlr;
	private int roomCapacity;
	private String roomLect;
	private String roomPhoto;
}
