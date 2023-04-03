package kr.or.ddit.room.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.room.service.RoomService;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
@Slf4j
@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	RoomService roomService;

	@GetMapping("/list")
	public String getAll(Model model, HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		List<RoomVO> roomList = roomService.getList();
		model.addAttribute("list", roomList);
		
		return "room/roomList";
	}

}
