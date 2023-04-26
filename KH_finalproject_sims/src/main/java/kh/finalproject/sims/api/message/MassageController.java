package kh.finalproject.sims.api.message;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class MassageController {
	final DefaultMessageService messageService;
	
	@Value("#{apikey['apikey.massageKey']}")
	private String massageKey;
	
	@Value("#{apikey['apikey.massageSecret']}")
	private String massageSecret;
	
    public MassageController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("massageKey", "massageSecret", "https://api.coolsms.co.kr");
    }
    
    
    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("/send-one")
    public SingleMessageSentResponse sendOne() {
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01027431304"); // 계정에서 등록할 발신번호 입력
        message.setTo("01027431304"); // 수신번호 입력
        message.setText("문자 테스트 "); // "SMS는 한글 45자, 영자 90자까지 입력할 수 있습니다."

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        
		return response;
    }
    
   
//	try {
//	  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
//	  messageService.send(message);
//	} catch (NurigoMessageNotReceivedException exception) {
//	  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
//	  System.out.println(exception.getFailedMessageList());
//	  System.out.println(exception.getMessage());
//	} catch (Exception exception) {
//	  System.out.println(exception.getMessage());
//	}
	
}
