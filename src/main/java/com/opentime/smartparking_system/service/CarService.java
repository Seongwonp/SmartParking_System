package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.CarDAO;
import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.vo.CarVO;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;

import java.sql.SQLException;

@Slf4j
public enum CarService {
    INSTANCE;

    private final CarDAO carDAO;
    private final ModelMapper modelMapper;

    CarService() {
        carDAO = new CarDAO();
        modelMapper = new ModelMapper();
    }

    public void addCar(CarDTO carDTO) throws SQLException {
        log.info("carDTO: {}", carDTO);
        CarDAO.insertCar(carDTO);

    }
    public CarDTO getCarInfo(String carId) throws SQLException {
        log.info("carNumber: {}", carId);
        if(carId.equals("")) {
            return null;
        }

        CarVO carVO = (CarVO) carDAO.getCarsByUserId(Integer.parseInt(carId));
        if(carVO == null) {
            return null;
        }
        return modelMapper.map(carVO, CarDTO.class);
    }
}
