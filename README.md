# Bank Kredit Riski və Filial Performansı Analizi 📊

Bu layihə bankın kredit portfelindəki riskli aktivlərin (gecikmədə olan kreditlərin) analizi və filialların risk performansının qiymətləndirilməsi məqsədilə hazırlanmışdır.

## 🛠️ İstifadə Olunmuş Alətlər:
- **SQL (Oracle):** Müştəri tranzaksiyaları və kredit datalarının filtrasiyası, risk kateqoriyalarının təyini.
- **Power BI:** Bank rəhbərliyi üçün interaktiv Kredit Riski Dashboard-unun qurulması.

## 🔍 Layihədə Həll Olunan Biznes Problemləri:
1. Hansı filiallarda vaxtı keçmiş kreditlərin (NPL) həcmi daha yüksəkdir?
2. Müştərilərin gəlir səviyyəsi ilə kredit gecikmələri arasında hansı korrelyasiya var?
3. Riski azaltmaq üçün hansı müştəri seqmentlərinə kredit satışları məhdudlaşdırılmalıdır?

---

## 💻 Layihədə İstifadə Olunan SQL Sorğusu:

```sql
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



