=# 📊 KREDİT PORTFELİNİN RİSK ANALİZİ Dashboard

## 📌 Layihə Haqqında (Project Overview)
Bu layihə, Kaggle platformasından götürülmüş real bank kredit datası əsasında, müştərilərin kredit risklərinin qiymətləndirilməsi və portfel analizi üçün hazırlanmışdır. Layihə çərçivəsində datanın təmizlənməsindən (ETL) başlayaraq, relyasiya verilənlər bazasının (RDBMS) qurulması və Power BI mühitində interaktiv "Executive" hesabatın hazırlanmasına qədər olan tam analitika boru kəməri (Data Pipeline) icra edilmişdir.

## 🛠️ İstifadə Olunan Texnologiyalar (Tech Stack)
* **Python (Pandas):** İlkin məlumatların təmizlənməsi, çatışmayan dəyərlərin (Missing values) doldurulması və anomal dəyərlərin (Outliers) nizamlanması.
* **Oracle SQL / PostgreSQL:** Təmizlənmiş datanın bazaya miqrasiyası, performans üçün optimallaşdırılmış View-ların yaradılması və analitik sorğuların (Aggregations) yazılması.
* **Power BI Desktop & Power Query:** * SQL tərəfindən hazırlanmış tək bütöv görünüş (Flat View) əsasında datanın optimallaşdırılması.
  * **Məlumat Tiplərinin Strukturlaşdırılması (Data Type Mapping):** Hesabatın düzgün işləməsi və DAX analizləri üçün mətn, tam ədəd (Integer), onluq kəsr (Decimal) və xüsusi olaraq `LOAN_STATUS` (Default flag) sütununun faiz/faiz dərəcəsi formatına konvertasiya edilməsi.
  * DAX ölçülərinin (Measures) yazılması və dinamik dashboard-un dizayn edilməsi.

## 🔍 Kredit Grade (Reytinq) Nədir?
Kredit Grade (Reytinq dərəcəsi), bank tərəfindən müştərinin maliyyə keçmişi, gəliri və etibarlılığı əsasında hesablanan **Risk Sinfidir**. Bu siniflər **A-dan G-yə qədər** sıralanır:
* **A Reytinqi (Əlaçı Müştəri):** Defolt (batma) riski ən aşağı olan, maliyyə vəziyyəti sabit müştərilərdir.
* **G Reytinqi (Yüksək Riskli Müştəri):** Keçmişdə ödənişləri gecikdirən və ya gəlir səviyyəsi qeyri-sabit olan, bank üçün ən təhlükəli müştərilərdir.

## 📉 Dashboard-dan Əldə Olunan Kritik Analitik Qeydlər (Insights)

1. **Reytinq Pisləşdikcə Riskin Artması (Pilləkən Effekti):**
   * Dashboard-da qurulmuş reytinq qrafiki subut edir ki, reytinq pisləşdikcə (`A`-dan `G`-yə doğru) kreditlərin batma faizi pilləli şəkildə artır.
   * `A` və `B` reytinqli müştərilərdə batma faizi **minimum (5-10%)** səviyyədə ikən, `E`, `F` və `G` reytinqli müştərilərdə bu göstərici **40%-i keçir**.
   * **Biznes Qərarı:** Bankın risk menecerlərinə tövsiyə olunur ki, `E`, `F` və `G` reytinqli müştərilərə kredit ayrılarkən riskin sığortalanması üçün **əlavə təminat (girov)** və daha **yüksək faiz dərəcəsi** tətbiq olunsun və ya kredit tamamilə rədd edilsin.

2. **Kredit Məqsədlərinə Görə Risk Payı:**
   * **Tibb (Medical)** və **Biznes (Venture)** məqsədli kreditlər portfeldə ən yüksək defolt (batma) dərəcəsinə malikdir. Risk menecerlərinə bu iki sahədə kredit şərtlərini yenidən nəzərdən keçirmək tövsiyə olunur.

3. **Demoqrafik Təsir və Filtrlər:**
   * Sol menyudakı dinamik filtrlər tətbiq edildikdə aydın şəkildə görünür ki, **Aşağı Gəlirli (<30K)** və **Kirayədə (RENT)** qalan müştərilər birbaşa yüksək risk qrupunu (E-G Grade) formalaşdırır.

## 🚀 Analitik Metriklər və DAX Hesablamaları
Dashboard-da istifadə olunan əsas daxili ölçülər:
* **Cəmi Kredit Portfeli:** `Cəmi Kredit Məbləği = SUM(v_credit_risk_bi[LOAN_AMNT])`
* **Ortalama Faiz Dərəcəsi:** `Ortalama Faiz = AVERAGE(v_credit_risk_bi[LOAN_INT_RATE])`
* **Batma Faiz Oranı (Default Rate):** `Batma Faizi (%) = AVERAGE(v_credit_risk_bi[LOAN_STATUS])`

## 📊 Dashboard Səhifə Quruluşu
* **Sol Menyu:** Gəlir Qrupu (Income Group) və Mənzil Statusu (Home Ownership) üzrə dinamik filtrləmə.
* **Yuxarı Panel:** Əsas KPI kartları (Portfel, Faiz, Risk Oranı).
* **Mərkəzi Panel:** Kredit məqsədlərinə görə məbləğ (Sütun) və risk faizinin (Xətt) qarışıq qrafiki.
* **Sağ Panel:** Yaş qruplarının payı (Donut) və Reytinqə görə risk artımı (Sütun).

---
Analitik: **C.Samir** *7+ illik Sənaye mühəndisliyi təcrübəsinin Data Analitikası alətləri ilə inteqrasiyası.*





