##Лабораторна робота № 5. Зчитування даних з WEB.
##В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100 фільмами 2017 року виходу за посиланням 
##«http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature». Необхідно створити data.frame «movies» 
##з наступними даними: номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). 
##Для виконання лабораторної рекомендується використати бібліотеку «rvest». CSS селектори для зчитування необхідних даних: 
##rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». 
##Для зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення 
##зчитаних html даних в текст- html_text. Рекомендується перетворити rank_data та runtime_data з тексту в числові значення. 
##При формуванні дата фрейму функцією data.frame рекомендується використати параметр «stringsAsFactors = FALSE».
##В результаті виконання лабораторної роботи необхідно відповісти на запитання:

Sys.setlocale("LC_CTYPE", "ukrainian")

resolvePath <- function(filename){
  working_dir = file.path('D:/', 'lab1')
  
  if(!dir.exists(working_dir)){
    dir.create(file.path(working_dir))   
  }
  
  if(!identical(getwd, file.path(working_dir))){
    setwd(file.path(working_dir)) 
  }

  return (paste('./', filename, sep = ''))
}
target_filename_5 = 'lab3_1_data.html';

library(rvest)

f_path = resolvePath(filename = target_filename_5)

if(!file.exists(f_path)){
  download.file(url = 'http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature', destfile = f_path, mode = 'wb')  
}

f_data <- read_html(f_path)

rank.data = html_nodes(f_data, '.text-primary') %>% html_text() %>% as.numeric()
rank.data %>% head()

title.data = html_nodes(f_data, '.lister-item-header a') %>% html_text()
title.data %>% head()

runtime = html_nodes(f_data,'.text-muted .runtime') %>% html_text() 
runtime = gsub(" min", "", runtime) %>% as.numeric()
runtime %>% head() 

movies <- data.frame(
  id = rank.data,  
  Title = title.data %>% as.character(),  
  Runtime = runtime, 
  stringsAsFactors = FALSE
)

##1
##Виведіть перші 6 назв фільмів дата фрейму

print(head(movies, 6)$Title)

##[1] "Тор: Рагнарок"                   "Людина-павук: Повернення додому"
##[3] "Вартовi Галактики 2"             "Unicorn Store"                  
##[5] "1+1: Нова iсторiя"               "Найвеличнiший шоумен" 

##2
##Виведіть всі назви фільмів с тривалістю більше 120 хв

print(movies[movies$Runtime>120,])

##   id                                    Title Runtime
##1   1                            Тор: Рагнарок     130
##2   2          Людина-павук: Повернення додому     133
##3   3                      Вартовi Галактики 2     136
##5   5                        1+1: Нова iсторiя     126
##7   7                               Диво-Жiнка     141
##9   9  Зорянi вiйни: Епiзод 8 - Останнi Джедаi     152
##10 10                                     Воно     135
##13 13             Той, хто бiжить по лезу 2049     164
##14 14 Пiрати Карибського моря: Помста Салазара     129
##17 17                               Форма води     123
##19 19                     Call Me by Your Name     132
##20 20                               Джон Уiк 2     122
##21 21                           Чужий: Заповiт     122
##23 23                     Красуня i Чудовисько     129
##25 25                          Логан: Росомаха     137
##26 26               Король Артур: Легенда меча     126
##29 29                                 Форсаж 8     136
##32 32                                    Мати!     121
##37 37             Трансформери: Останнiй лицар     154
##38 38                                The Shack     132
##40 40                  Kingsman: Золоте кiльце     141
##41 41                                Гра Моллi     140
##44 44           Валерiан i мiсто тисячi планет     137
##45 45                        Пострiл в безодню     121
##48 48                                  Метелик     133
##55 55                           Примарна нитка     130
##60 60                                   Вороги     134
##61 61                   Brawl in Cell Block 99     132
##63 63                Вбивство священного оленя     121
##65 65                           Only the Brave     134
##73 73                               Темнi часи     125
##74 74                Saban's Могутнi рейнджери     124
##77 77                               Сiм сестер     123
##79 79                          Усi грошi свiту     132
##86 86                         The Glass Castle     127
##87 87                    Вiйна за планету мавп     140
##90 90               Дружина доглядача зоопарку     127

##3
##Скільки фільмів мають тривалість менше 100 хв

print(sum(movies$Runtime<100))

##[1] 15
