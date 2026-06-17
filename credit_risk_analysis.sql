-- Kredit Gecikmələri və Müştəri Risk Analizi
SELECT 
    customer_id,
    customer_name,
    loan_amount,
    loan_type,
    days_past_due, -- Gecikmə günlərinin sayı
    -- Gecikmə gününə əsasən Risk Kateqoriyasının təyin edilməsi
    CASE 
        WHEN days_past_due = 0 THEN 'Normal (Risk Yoxdur)'
        WHEN days_past_due BETWEEN 1 AND 30 THEN 'Yüngül Risk (1-30 Gün)'
        WHEN days_past_due BETWEEN 31 AND 90 THEN 'Orta Risk (31-90 Gün)'
        ELSE 'Yüksək Risk (NPL - 90+ Gün)'
    END AS risk_category,
    branch_name
FROM 
    atb_loan_portfolio
WHERE 
    is_active = 1
ORDER BY 
    days_past_due DESC;
