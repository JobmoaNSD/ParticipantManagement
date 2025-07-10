
/**
 * TextArea로 저장된 값에 대한 내용중 Enter 키를 HTML 코드 <br> Code로 전환
 */
function lineFeedChange(textData){
    
    return textData.replace(/\n/g, "<br>");
}