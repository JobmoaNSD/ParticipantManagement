package com.jobmoa.app.biz.particcertif;

import lombok.Data;

@Data
public class ParticcertifDTO {
    private int particcertifPartNo; //자격증 PK 번호
    private int particcertifJobNo; //참여자 PK 번호
    private String[] particcertifCertif; //자격증 명칭

}
