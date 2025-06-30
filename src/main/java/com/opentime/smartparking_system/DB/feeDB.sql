CREATE TABLE feePolicy
(
    policyId       INT AUTO_INCREMENT PRIMARY KEY,
    policyName     VARCHAR(50) NOT NULL,
    baseTime       INT         NOT NULL, -- 기본 시간 (분)
    baseFee        INT         NOT NULL, -- 기본 요금 (원)
    additionalTime INT         NOT NULL, -- 추가 시간 단위 (분)
    additionalFee  INT         NOT NULL, -- 추가 요금 (원)
    dailyMaxFee    INT         NOT NULL  -- 일일 최대 요금 (원)
);


INSERT INTO feePolicy (policyName, baseTime, baseFee, additionalTime, additionalFee, dailyMaxFee)
VALUES ('기본 요금제', 60, 2000,
        30, 1000, 15000);