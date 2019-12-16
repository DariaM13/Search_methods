##Лабораторна робота № 3. Завантаження та зчитування даних
##перед виконанням лабораторних робіт встановлюємо необхідні бібліотеки для зчитування файлів (install.packeges(""))
##у форматах xlsx, csv, xml, hdf5, html.

Sys.setlocale("LC_CTYPE", "ukrainian")
library("readxl");

resolvePath <- function(filename){
  working_dir = file.path('D:/', 'lab3')
  
  if(!dir.exists(working_dir)){
    dir.create(file.path(working_dir))   
  }
  
  if(!identical(getwd, file.path(working_dir))){
    setwd(file.path(working_dir)) 
  }

  return (paste('./', filename, sep = ''))
}

target_filename_1 = 'lab3_1_data.xlsx';
target_filename_2 = 'lab3_2_data.csv';
target_filename_3 = 'lab3_3_data.xml';

##Part 1 За допомогою download.file() завантажте любий excel файл з порталу 
##http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”). 
##Виведіть перші 6 строк отриманого фрейму даних.

f_path = resolvePath(filename = target_filename_1)

if(!file.exists(f_path)){
  download.file(url = 'https://data.gov.ua/dataset/4b5ff0e3-b3de-4c54-b03b-be9077d576bb/resource/de4189ce-0a58-48a9-a374-a184f6a8dc85/download/struktura-aparatu-derzhgeokadastru.xlsx', destfile = f_path, mode = 'wb')  
}

file_data = read_excel(f_path)

print(head(file_data, 6))

##`СТРУКТУРА апарату Державної служби України з питань геодез~ ...2              
##  <chr>                                                        <chr>             
##1 NA                                                           NA                
##2 Назва структурного підрозділу                                Кількість штатних~
##3 Керівництво                                                  3                 
##4 Департамент адміністративно-господарського забезпечення      26                
##5 Відділ захисту інформації  та електронного урядування        8                 
##6 Відділ контролю                                              5 

##Part 2 
##За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням 
##https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та завантажте дані в R. Code book, 
##що пояснює значення змінних знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 
##Необхідно знайти, скільки property мають value $1000000+

f_path = resolvePath(filename = target_filename_2)

if(!file.exists(f_path)){
  download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata/data/ss06hid.csv', destfile = f_path, mode = 'wb')  
}

file_data = read.csv(f_path)
buff = file_data$VAL>13
print(sum(buff, na.rm = TRUE))

##[1] 3290

##Part3
##Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
##Скільки ресторанів мають zipcode 21231?

library("XML")

f_path = resolvePath(filename = target_filename_3)

if(!file.exists(f_path)){
  download.file(url = 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml', destfile = f_path, mode = 'wb')  
}
# parse - unpack structure of xml tree 
doc = xmlParse(f_path)
# xpathapply - the way to some element (the location of element in xml file)
buff = xpathApply(doc, "//zipcode[text()='21231']", xmlValue)

print(length(buff))

##[1] 127
