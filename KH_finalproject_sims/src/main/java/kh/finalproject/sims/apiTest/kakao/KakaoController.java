package kh.finalproject.sims.apiTest.kakao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.sims.user.model.service.UserMemberService;
import kh.finalproject.sims.user.model.vo.MemberVo;
import kh.finalproject.sims.user.model.vo.UserMemberVo;
import lombok.AllArgsConstructor;

@Controller
public class KakaoController {
	
    @Autowired
	private KakaoService kakaoService;
    
    @Autowired
    private UserMemberService memberService;
    
    @Autowired
	private BCryptPasswordEncoder pwEncoder;

    @RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session, HttpServletRequest req, Model mo) throws Exception {

        // 접속토큰 get
        String kakaoToken = kakaoService.getReturnAccessToken(code, req);

        // 접속자 정보 get
        Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
        String snsId = (String) result.get("id");
        
        // 일치하는 snsId 없을 시 회원가입
        if (memberService.kakaoLogin(snsId) == null) {
            mo.addAttribute("tokenResult", result);
            mo.addAttribute("kakaoToken", kakaoToken);
            
            return "/main/kakaoJoin";
        }

        // 일치하는 snsId가 있으면 멤버객체에 담음.
        MemberVo vo = memberService.findByUserId(snsId);
        
        /*Security Authentication에 붙이는 과정*/
        List<GrantedAuthority> roles = new ArrayList<>(1);
        roles.add(new SimpleGrantedAuthority(vo.getRole()));
        Authentication auth = new UsernamePasswordAuthenticationToken(vo.getId(), null, roles);
        SecurityContextHolder.getContext().setAuthentication(auth);

        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);

        return "redirect:/";

    }
    
    @RequestMapping("/logoutKakao")
    public ModelAndView logoutKakao(ModelAndView mv, HttpSession session) throws Exception {
    	kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
    	session.setAttribute("kakaoToken", null);
    	
    	mv.setViewName("redirect:/logout");
    	return mv;
    }
    
    @GetMapping("/kakaoJoin")
    public ModelAndView kakaoContract(ModelAndView mv) throws Exception {
    	
    	mv.setViewName("main/kakaoJoin");
    	
    	return mv;
    }
    
    @PostMapping("/kakaoJoin")
    public ModelAndView kakaoJoin(ModelAndView mv, HttpSession session, MemberVo memberVo, UserMemberVo userMemberVo, String kakaoToken) throws Exception {
    	
    	String snsId = memberVo.getId();
    	
    	memberVo.setOpinion(snsId);
    	memberVo.setPw(pwEncoder.encode(snsId));
    	memberVo.setEnable(1);
        memberVo.setRole("ROLE_USER");
        memberVo.setId(userMemberVo.getUserEmail());
        userMemberVo.setUserId(userMemberVo.getUserEmail());
        
        memberService.kakaoJoin(memberVo, userMemberVo);
        
        // 일치하는 snsId가 있으면 멤버객체에 담음.
        MemberVo vo = memberService.findByUserId(snsId);
        
        /*Security Authentication에 붙이는 과정*/
        List<GrantedAuthority> roles = new ArrayList<>(1);
        roles.add(new SimpleGrantedAuthority(vo.getRole()));
        Authentication auth = new UsernamePasswordAuthenticationToken(vo.getId(), null, roles);
        SecurityContextHolder.getContext().setAuthentication(auth);

        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);
    	
    	mv.setViewName("redirect:/");
    	
    	return mv;
    }

}