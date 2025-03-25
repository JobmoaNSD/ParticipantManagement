package com.jobmoa.app.biz.bean;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class SearchBean {
    private String search;
    private int page;
    private String endDateOption;
    private String searchOption;
    private int pageRows;
    private String searchType;
    private String column;
    private String order;
    private String participantRegDate;

    @Override
    public String toString() {
        //SearchBean 으로 들어온 값이 null or 0 이면 값을 제거 후 등록
        this.search = (this.search == null)?"":this.search;
        this.endDateOption = (this.endDateOption == null)?"":this.endDateOption;
        this.searchOption = (this.searchOption == null)?"":this.searchOption;
        this.searchType = (this.searchType == null)?"":this.searchType;
        int pageString = (this.page == 0)?1:this.page;
        int pageRowsString = (this.pageRows == 0)?100:this.pageRows;
        this.column = (this.column == null)?"":this.column;
        this.order = (this.order == null)?"":this.order;
        this.participantRegDate = (this.participantRegDate == null)?"All":this.participantRegDate;

        String returnValue ="page=" + pageString +
                "&endDateOption=" + endDateOption +
                "&searchOption=" + searchOption +
                "&search=" + search +
                "&pageRows=" + pageRowsString +
                "&searchType=" + searchType +
                "&column=" + column +
                "&order=" + order +
                "&participantRegDate=" + participantRegDate;

        return returnValue;
    }

}
