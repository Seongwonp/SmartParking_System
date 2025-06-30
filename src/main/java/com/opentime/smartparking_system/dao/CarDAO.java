package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.util.ConnectionUtil;
import com.opentime.smartparking_system.model.dto.CarDTO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    //차량 등록
    public static void insertCar(CarDTO car) throws SQLException {
        String sql = "insert into car (userId, carNumber, carModel, carType)  values(?,?,?,?)";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, String.valueOf(car.getUserId()));
            preparedStatement.setString(2, car.getCarNumber());
            preparedStatement.setString(3, car.getCarModel());
            preparedStatement.setString(4, car.getCarType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //차량 목록 조회
    public List<CarDTO> getCarsByUserId(int userId) throws SQLException {
        List<CarDTO> carDTOList = new ArrayList<>();
        String sql = "select * from car where userId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                CarDTO carDTO = CarDTO.builder()
                        .carNumber(resultSet.getString("carNumber"))
                        .carModel(resultSet.getString("carModel"))
                        .carType(resultSet.getString("carType"))
                        .build();
                carDTOList.add(carDTO);
            }
            return carDTOList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
