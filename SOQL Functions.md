# SOQL Functions

## Format 

Permite mostrar valores de **número**, **fecha**,**tiempo**, y **moneda** en el formato local del usuario.

### Ejemplo moneda sin format

```Apex
Select id,Name,IP_PrecioBase__c from Libro__c where id = 'a018X00000YPeZrQAL'
```
![image](https://user-images.githubusercontent.com/100179095/192174422-d6a3f4e9-7cac-4875-ba76-3285e58f94f6.png)

### Ejemplo moneda con format

```Apex
Select id,Name,format(IP_PrecioBase__c) from Libro__c where id = 'a018X00000YPeZrQAL'
```

![image](https://user-images.githubusercontent.com/100179095/192174456-706cf5f6-7170-4656-88c3-88553fea48b0.png)

## convertCurrency

Permite convertir el valor original de un campo moneda en la moneda del usuario. Se puede combinar con la función **format**

```Apex
Select id,Name,format(convertCurrency(IP_PrecioBase__c)) from Libro__c where id = 'a018X00000YPeZrQAL'
```
![image](https://user-images.githubusercontent.com/100179095/192174521-c8c5a6f1-361d-4db5-bcbc-80f13d3c6ba3.png)

