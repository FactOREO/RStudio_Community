library(tidyverse)

Data<-tibble::tribble(
  ~en_name, ~week_no,                                 ~schoolid,                ~teacherid,                    ~cal_name1,                             ~cal_name2,                         ~cal_name3,                          ~cal_name4,                        ~cal_name5,                         ~cal_name6,                               ~cal_name7,                           ~cal_name8, ~q_1_1, ~q_2_1, ~q_3_1, ~q_4_1, ~q_5_1, ~q_6_1, ~q_7_1, ~q_8_1,
  "Netravathi Kattimani",       1L, "GLPS CHABBI PLOT NEKAR NAGAR HALE HUBLI",     "Elizabeth Banikatti", "Abbas Ali Nanamattik-ZUQ207",                 "Mushruf Mulla-MZE987",         "Saiyed Navalagund-OGN003",           "Dongrima Walikar-FHG475",        "Umekusum Bellihal-KNT615",   "Fathima Zahara Bellihal-RLY981",            "Yashaswini Khanbargi-TPP643",              "Ananya Kopardi-TQQ828",     1L,     1L,     1L,     0L,     1L,     0L,     1L,     1L,
  "Netravathi Kattimani",       1L, "GLPS CHABBI PLOT NEKAR NAGAR HALE HUBLI", "Sureka nagappa belawadi",    "MD Amaan Nalambad-QYW348",                    "Imbrahim B-UIS798",       "MD. arfan Bavikatti-VYD916",              "Raheem Jakati-YOT663",       "Khasimsab Makandar-VGM989",           "Bharath Mankani-UHK261",                                       NA,                                   NA,     0L,     1L,     0L,     0L,     0L,     0L,     0L,     0L,
  "Gayathri Anikivi",       2L,                       "GHPS KURUBAGATTI.",   "Prabhavati.M.Gunavant",   "Akash.Y.Guddanavar-JXH849",              "Bharath.N.Poojar-BSL042",     "Dyavappa.H.Bettanavar-ZRH198",      "Manikant.R.mummigatti-MPG298",      "Aliyabegum.D.Nadhaf-SYN159",         "Mallige.M.Malledi-OHD802",            "Maktumbi.I.sanigatti-IZI558",                                   NA,     1L,     1L,     0L,     0L,     1L,     0L,     1L,     0L,
  "Gayathri Anikivi",       2L,                       "GHPS KURUBAGATTI.",       "Jyoti.Yavagalmath",   "Abhishek.M.Nargund-CTG024",                "Manoj.N.Katger-XHZ205",         "Pradeep.N.Koobnal-OVN977",             "Paizal M Mulla-TXDD6J",       "Manjunath  P pojar-S6S472",          "Gangavva malledi-H0AFJU",             "Nagaraj F Gundagovi-CZY5R9",             "Manikantha meti-64V58V",     1L,     1L,     1L,     0L,     1L,     1L,     0L,     1L,
  "Maruti Kattimani",       3L,          "GHPS SIDDHESHWAR NAGAR DHARWAD",   "Basavaraj I Managundi",   "Ankitha Kondapilli-RLO453",       "Yashaswini Ontettinavar-YII784",              "Kavya Konnur-HFC295", "Divya Fakeerappa Kariyavar-A5OJLR",      "Gaytri Suresh Morab-BBLKK1",                                 NA,                                       NA,                                   NA,     0L,     1L,     1L,     0L,     0L,     0L,     0L,     0L,
  "Maruti Kattimani",       3L,          "GHPS SIDDHESHWAR NAGAR DHARWAD",      "Jayalalita Badiger",       "Vinayak Gawadi-GNB587", "Amruta Shekappa ontyattinavar-6GGXCW", "Anita Hanumantappa Konnur-7OS697",  "Chaitanya Shivanad Konnur-9BW4FK", "Kalpana Pakkiresh Badagi-XERLLT", "Pavan Dharmo Haranshikari-EEN549", "Shankravva Somanna Haranshikari-ZGKXAN", "Shivaji Hanmanthappa Kulavi-TOM915",     1L,     0L,     1L,     0L,     0L,     0L,     0L,     1L
)

Result <- Data |>
  # pivot student names into one column
  pivot_longer(
    cols = starts_with("cal"),
    names_to = 'id_student', values_to = 'student') |>
  # pivot scores into one column
  pivot_longer(
    cols = starts_with("q"),
    names_to = 'id_score', values_to = 'score'
  ) |>
  # edit the IDs and filter
  mutate(
    id_student = str_remove(id_student,"cal_name"),
    id_score = str_remove(sub("(_\\d+.*?)_\\d+", "\\1", id_score), 'q_')
  ) |>
  filter(
    id_student == id_score
  ) |>
  select(
    en_name, teacherid, 'week' = week_no, schoolid, student, 'attendance' = score
  )

Result