package com.opentime.smartparking_system.util;

import org.modelmapper.ModelMapper;
import org.modelmapper.config.Configuration;
import org.modelmapper.convention.MatchingStrategies;

public enum MapperUtil {
    INSTANCE;

    private final ModelMapper modelMapper;
    MapperUtil() {
        this.modelMapper = new ModelMapper();
        modelMapper.getConfiguration()
                .setFieldMatchingEnabled(true)
                .setFieldAccessLevel(Configuration.AccessLevel.PRIVATE)
                .setMatchingStrategy(MatchingStrategies.STRICT);
        // STRICT : 엄격모드, 필드명과 타입이 모두 일치해야 매핑
    }
    public ModelMapper getModelMapper() {
        return modelMapper;
    }
}
