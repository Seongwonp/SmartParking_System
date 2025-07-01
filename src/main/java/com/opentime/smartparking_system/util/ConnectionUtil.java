package com.opentime.smartparking_system.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public enum ConnectionUtil {

   INSTANCE;
   private final HikariDataSource dataSource;

   ConnectionUtil() {
       HikariConfig config = new HikariConfig();
       config.setDriverClassName("org.mariadb.jdbc.Driver");
       config.setJdbcUrl("jdbc:mariadb://localhost:3306/smartParking");
       config.setUsername("root");
       config.setPassword("0327");
       config.addDataSourceProperty("cachePrepStmts", "true");
       config.addDataSourceProperty("prepStmtCacheSize", "250");
       config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
       dataSource = new HikariDataSource(config);
   }

   public Connection getConnection() throws SQLException {
       return dataSource.getConnection();
   }
}
