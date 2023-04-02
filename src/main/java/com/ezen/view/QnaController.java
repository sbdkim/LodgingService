package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.biz.dto.HostVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.QnaVO;
import com.ezen.biz.service.QnaService;

@Controller
public class QnaController {
	 
	 @Autowired
	 private QnaService qnaService;	
	 
	 @GetMapping(value="/qna_list")
		
		public String qnaList(HttpSession session,  Model model) {
			//
			MemberVO loginUser=	(MemberVO)session.getAttribute("loginUser");
			
		    if(loginUser == null) {//로그인이 안된경우
				
			    return "member/login";
					
			}else{
			    
				List<QnaVO> qnaList = qnaService.getListQna(loginUser.getEmail());
				
			
		    
		    model.addAttribute("qnaList", qnaList);
				
			return "mypage/qnaList";
			}
		}
	 
	 @PostMapping("/qna_write")
		public String qunWriteAction(HttpSession session,  Model model, QnaVO vo) {
	     MemberVO loginUser= (MemberVO)session.getAttribute("loginUser");
			
		    if(loginUser == null) {//로그인이 안된경우
				
			    return "member/login";
					
			}else{	
				vo.setEmail(loginUser.getEmail());//아이디 넣어주기
				qnaService.insertQna(vo);
				return "redirect:qna_list";
			}
			
		}
	 
	 @GetMapping("/qna_view")
		public String qnaView(HttpSession session,  Model model, QnaVO vo) {
		MemberVO loginUser=	(MemberVO)session.getAttribute("loginUser");
			
		    if(loginUser == null) {//로그인이 안된경우
				
			    return "member/login";
					
			}else{	
				//화면에서 입력받은 qseq를 입력 파라미터로 하여 qna 상세 조회
				QnaVO qna =qnaService.getQna(vo.getQseq());
				
			
		    model.addAttribute("qnaVO", qna);
		    
		    return "mypage/qnaView";
		}
		
		
		}
	 
	 @GetMapping("/qna_write_form")
		public String qnaWriteView(HttpSession session,  QnaVO vo) {
			 MemberVO loginUser=	(MemberVO)session.getAttribute("loginUser");
				
			    if(loginUser == null) {//로그인이 안된경우
					
				    return "member/login";
						
				}else{	
					
			
			return "mypage/qnaWrite";
				}
		}
	 // 호스트 별 큐엔아이
	 @GetMapping(value="/qna_listByHost")
		
		public String qnaListHost(HttpSession session,  Model model, QnaVO vo) {
			//
			HostVO loginHost=	(HostVO)session.getAttribute("loginHost");
			
		    if(loginHost == null) {//로그인이 안된경우
				
			    return "member/login";
					
			}else{
			    
				List<QnaVO> qnaListByHost = qnaService.getListByHost(vo);
				
			
		    
		    model.addAttribute("qnaListByHost", qnaListByHost);
				
			return "mypage/qnaList";
			}
		}
	
	
}
