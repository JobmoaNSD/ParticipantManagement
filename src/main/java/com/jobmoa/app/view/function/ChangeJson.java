package com.jobmoa.app.view.function;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cglib.core.internal.Function;
import org.springframework.stereotype.Controller;

import java.util.List;

@Slf4j
@Controller
public class ChangeJson {
    /**
     * 주어진 리스트를 JSON 배열 형식의 문자열로 변환하는 유틸리티 메서드입니다.
     * 사용 방법
     *changeJson.convertListToJsonArray(datas, item -> {
     *             EducationDTO dto = (EducationDTO) item;  // 객체 캐스팅
     *             return "{\"jsonID\":\"" + jsonDATA + "\","
     *                     + "\"jsonID\":\"" + jsonDATA + "\"}";
     *
     * @param list 변환할 객체 리스트
     * @param getJsonString 변환할 개별 아이템을 JSON 문자열로 만드는 람다 함수
     * @return 변환된 JSON 배열 문자열
     */
    public String convertListToJsonArray(List<?> list, Function<Object, String> getJsonString) {
        // 리스트가 null이거나 비어있으면 빈 배열을 반환
        if (list == null || list.isEmpty()) {
            return "[]";
        }

        // JSON 배열을 상태적으로 생성하기 위한 StringBuilder 사용
        StringBuilder jsonArrayBuilder = new StringBuilder("[");

        // 리스트의 각 아이템을 JSON 형식으로 변환하여 추가
        for (Object item : list) {
            jsonArrayBuilder.append(getJsonString.apply(item)).append(",");
        }

        // 마지막에 추가된 ','(쉼표)를 제거하고 배열 닫기
        if (jsonArrayBuilder.length() > 1) {
            jsonArrayBuilder.setLength(jsonArrayBuilder.length() - 1);
        }
        jsonArrayBuilder.append("]");

        // 로그에 변환 결과 출력
        log.info("Converted JSON Array: [{}]", jsonArrayBuilder);

        // 최종 JSON 배열 문자열 반환
        return jsonArrayBuilder.toString();
    }
}
