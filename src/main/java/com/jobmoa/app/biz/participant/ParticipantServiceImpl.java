package com.jobmoa.app.biz.participant;

import java.util.List;

public interface ParticipantServiceImpl {
    public List<ParticipantDTO> selectAll(ParticipantDTO participantDTO);
    public ParticipantDTO selectOne(ParticipantDTO participantDTO);
    public boolean insert(ParticipantDTO participantDTO);
    public boolean update(ParticipantDTO participantDTO);
    public boolean delete(ParticipantDTO participantDTO);
}
