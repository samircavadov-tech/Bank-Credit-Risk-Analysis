CREATE OR REPLACE VIEW v_credit_risk_bi AS
SELECT 
    person_age,
    -- Yaş qrupları yaradırıq
    CASE 
        WHEN person_age BETWEEN 18 AND 25 THEN '18-25 (Genc)'
        WHEN person_age BETWEEN 26 AND 40 THEN '26-40 (Orta Yas)'
        WHEN person_age BETWEEN 41 AND 60 THEN '41-60 (Tecrubeli)'
        ELSE '60+ (Teqaudcu)'
    END AS age_group,

    person_income,
    -- Gəlir qrupları yaradırıq
    CASE 
        WHEN person_income < 30000 THEN '1. Asagi Gelir (<30K)'
        WHEN person_income BETWEEN 30000 AND 70000 THEN '2. Orta Gelir (30K-70K)'
        WHEN person_income BETWEEN 70001 AND 120000 THEN '3. Yuksek Gelir (70K-120K)'
        ELSE '4. VIP (>120K)'
    END AS income_group,

    person_home_ownership,
    person_emp_length,
    loan_intent,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    loan_status, -- Bizim hədəf sütunumuz (0 = Ödəyir, 1 = Batıb)
    loan_percent_income,
    cb_person_default_on_file,
    cb_person_cred_hist_length
FROM cleaned_credit_risk;
