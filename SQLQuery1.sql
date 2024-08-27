use HastaneDB

select d.Adi,d.Soyadi,h.Adi,h.Soyadi,p.Poliklinik_Adi from Poliklinikler p 
join Doktorlar d on p.ID = d.Poliklinik_ID
join Hemsireler h on p.ID = h.Poliklinik_ID

select COUNT(ID) as'Aktif Randevu Say�s�' from Randevular where Randevu_Durumu = 'Aktif'


select d.Adi,d.Soyadi,b.Bolum_Adi from Doktorlar d 
join Bolumler b on d.Bolum_ID = b.ID
where d.Adi = 'Fatih' and d.Soyadi = 'Eraslan'

select SUM(Personel_Sayisi) as'Toplam Personel Say�s�' from Bolumler 

-- Doktorlara aitaktif olan randevular� yanlar�nda doktor ad� soyad� ve poliklinik ad� olacak �ekilde listeleyin
select d.Adi,d.Soyadi,r.Randevu_Durumu,p.Poliklinik_Adi from Doktorlar d 
join Randevular r on d.ID = r.Doktor_ID
join Poliklinikler p on d.Poliklinik_ID = p.ID
where r.Randevu_Durumu ='Aktif'

select COUNT(ID) as '��kan tahlil sonu�lar�' from Tahliller where Tahlil_Sonuc = '��kt�'

-- Be�ikta�ta oturan personellerin Ad� Soyad� Adres ve �nvan�n� Listeleyin
select m.Adi,m.Soyadi,p.Adres,p.Unvan from Personel p 
join Memurlar m on p.ID = m.Personel_ID
where p.Adres like('%Be�ikta�%')

-- Hastan�n ad�n� Soyad�n� ve Doktorun Ad� ve soyad�n� 
-- en sonundada Tahlil sonucu ve tahlil ad�n� 
-- listeleyen bir join yaz�n
select h.Adi as 'Hasta Ad�',h.Soyadi as 'Hasta Soyad�' ,
d.Adi as 'Doktor Ad�',d.Soyadi as 'Doktor Soyad�',
t.Tahlil_Adi,t.Tahlil_Sonuc 
from Hastalar h 
join Tahliller t on h.ID = t.Hasta_ID
join Doktorlar d on d.ID = t.Doktor_ID
