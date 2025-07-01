package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.CarDAO;
import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.vo.CarVO;
import com.opentime.smartparking_system.util.MapperUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.taglibs.standard.lang.jstl.GreaterThanOperator;
import org.modelmapper.ModelMapper;

import java.sql.SQLException;
import java.util.List;

@Slf4j
public enum CarService {
    INSTANCE;

    private final CarDAO carDAO;
    private final ModelMapper modelMapper;

    CarService() {
        carDAO = new CarDAO();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    //차량 등록
    public void addCar(CarDTO carDTO) throws SQLException {
        log.info("carDTO: {}", carDTO);
        carDAO.insertCar(carDTO);

    }
    //차량 ID로 차량 하나 상세조회
    public CarDTO getCarInfo(String carId) throws SQLException {
        log.info("carId: {}", carId);
        CarDTO carVO = carDAO.getCarById(Integer.parseInt(carId));
        return modelMapper.map(carVO, CarDTO.class);
    }
    //내 차량 목록 조회
    public List<CarDTO> getCarList(int userId) throws SQLException {
        log.info("userId: {}", userId);
        return carDAO.getCarsByUserId(userId);
    }
}
