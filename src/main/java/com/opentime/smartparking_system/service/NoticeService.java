package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.NoticeDAO;
import com.opentime.smartparking_system.model.dto.NoticeDTO;
import com.opentime.smartparking_system.model.vo.NoticeVO;
import com.opentime.smartparking_system.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;

@Log4j2
public enum NoticeService {
    INSTANCE;
    private final NoticeDAO noticeDAO;
    private final ModelMapper modelMapper;

    NoticeService(){
        noticeDAO = new NoticeDAO();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }


    public List<NoticeDTO> getAllNotice(int offset, int limit){
        log.info("getListNotice called with limit: {}, offset: {}", limit, offset);
        List<NoticeVO> noticeVOList = noticeDAO.getListNotice(offset, limit);
        List<NoticeDTO> noticeDTOList = new ArrayList<>();
        for(NoticeVO noticeVO : noticeVOList){
            NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);
            noticeDTOList.add(noticeDTO);
        }
        return noticeDTOList;
    }

    public NoticeDTO getNotice(int id){
        log.info("getNotice called with id: {}", id);
        NoticeVO noticeVO = noticeDAO.getNoticeById(id);
        if(noticeVO == null) return null;
        return modelMapper.map(noticeVO, NoticeDTO.class);
    }

    public List<NoticeDTO> searchNotice(int offset, int limit, String text){
        if(text == null || text.trim().isEmpty()) return getAllNotice(offset, limit);
        List<NoticeVO> noticeVOList = noticeDAO.searchNotice(offset, limit, text);
        List<NoticeDTO> noticeDTOList = new ArrayList<>();
        for(NoticeVO noticeVO : noticeVOList){
            NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);
            noticeDTOList.add(noticeDTO);
        }
        return noticeDTOList;
    }


    public int getTotalNoticeCount() {
        return noticeDAO.getNoticeCount();
    }


    public int getSearchNoticeCount(String text) {
        if(text == null || text.trim().isEmpty()) return getTotalNoticeCount();
        return noticeDAO.getSearchNoticeCount(text);
    }

    public void addView(int noticeId){
        noticeDAO.addView(noticeId);
    }

}
