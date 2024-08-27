use HastaneDB

select d.Adi,d.Soyadi,h.Adi,h.Soyadi,p.Poliklinik_Adi from Poliklinikler p 
join Doktorlar d on p.ID = d.Poliklinik_ID
join Hemsireler h on p.ID = h.Poliklinik_ID

select COUNT(ID) as'Aktif Randevu Sayýsý' from Randevular where Randevu_Durumu = 'Aktif'


select d.Adi,d.Soyadi,b.Bolum_Adi from Doktorlar d 
join Bolumler b on d.Bolum_ID = b.ID
where d.Adi = 'Fatih' and d.Soyadi = 'Eraslan'

select SUM(Personel_Sayisi) as'Toplam Personel Sayýsý' from Bolumler 

-- Doktorlara aitaktif olan randevularý yanlarýnda doktor adý soyadý ve poliklinik adý olacak þekilde listeleyin
select d.Adi,d.Soyadi,r.Randevu_Durumu,p.Poliklinik_Adi from Doktorlar d 
join Randevular r on d.ID = r.Doktor_ID
join Poliklinikler p on d.Poliklinik_ID = p.ID
where r.Randevu_Durumu ='Aktif'

select COUNT(ID) as 'Çýkan tahlil sonuçlarý' from Tahliller where Tahlil_Sonuc = 'Çýktý'

-- Beþiktaþta oturan personellerin Adý Soyadý Adres ve Ünvanýný Listeleyin
select m.Adi,m.Soyadi,p.Adres,p.Unvan from Personel p 
join Memurlar m on p.ID = m.Personel_ID
where p.Adres like('%Beþiktaþ%')

-- Hastanýn adýný Soyadýný ve Doktorun Adý ve soyadýný 
-- en sonundada Tahlil sonucu ve tahlil adýný 
-- listeleyen bir join yazýn
select h.Adi as 'Hasta Adý',h.Soyadi as 'Hasta Soyadý' ,
d.Adi as 'Doktor Adý',d.Soyadi as 'Doktor Soyadý',
t.Tahlil_Adi,t.Tahlil_Sonuc 
from Hastalar h 
join Tahliller t on h.ID = t.Hasta_ID
join Doktorlar d on d.ID = t.Doktor_ID
