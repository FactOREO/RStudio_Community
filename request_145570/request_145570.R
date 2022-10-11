library(tidyverse)

data1<-tibble::tribble(
  ~s.no,   ~school_region, ~school_code,                   ~school_name,  ~dise_code, ~master_trainer, ~allotted_instructor,        ~instructor_name,            ~selectedteachername,                              ~child_name_scto,
  1L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",        "Jayashree S Shiraguppi",                 "Rijavanali  N  Vaddo-QYZ174",
  2L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",        "Jayashree S Shiraguppi",                    "Mustakeem E Nayak-AEF275",
  3L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",        "Jayashree S Shiraguppi", "Md gousa Sakalainaraja.  M   Sheradi-DXB584",
  4L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",        "Jayashree S Shiraguppi",             "Arshin rayazmahamad shek-D9POCT",
  5L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",                        "Nithin",             "Mahamad jubera M  Hakeem-5O7VJP",
  6L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",                        "Nithin",               "Khajagareeb  N  Chouri-56NTB1",
  7L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",                        "Nithin",               "Sarafaraj M Shirahatti-R4ERTZ",
  8L, "Hubballi Urban",     "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI", 29090606704,    "Madhumathi",             "INS023", "Pushpalatha Chinagudi",                        "Nithin",        "Madiya mahamad gous mundaragi-34O6KT",
  9L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                 "Preetham A Dandewale-MSO547",
  10L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                   "Rithesh U Dalewale-VFQ817",
  11L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                   "Sameera C Madewale-OZH670",
  12L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                  "Sandhya J Koramaddi-LLK505",
  13L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                  "Samarth E Garewalle-NJV716",
  14L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                  "Sheetal P Madewalle-OLN920",
  15L,  "Dharwad Rural",     "SCH006",          "GLPS DADDIKAMALAPUR", 29090700313,    "Madhumathi",             "INS014",      "Sajani Nainegali", "Jayashree Shrishail Kambimath",                    "Vijay S Khanewale-XGT339",
  16L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",        "Anpurna C Police patil",                     "shridhar s katti-HJK525",
  17L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",        "Anpurna C Police patil",                     "shreyas M Naykar-GKS383",
  18L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",        "Anpurna C Police patil",                "Manoja S mangoniyavar-BWT967",
  19L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",        "Anpurna C Police patil",                     "Jyoti I  sogalad-IQS051",
  20L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",                        "Ganesh",                   "Vaishnavi.shivalli-CLPP6B",
  21L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",                        "Ganesh",                     "Sufiya Hasansabh-PFMBPU",
  22L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",                        "Ganesh",                "Pranav prakash Asundi-GJHILQ",
  23L, "Hubballi Rural",     "SCH007",             "GHPS SULLA HUBLI", 29090201202,          "Anil",             "INS013",    "Bharathi Dalbanjan",                        "Ganesh",            "VijayKumar  M  pashupatti-AIE697"
)


data2<-tibble::tribble(
  ~regionid, ~schoolid,                    ~schoolname,                      ~teacherid,   ~masterid, ~instructorid,                    ~student_name1,                  ~student_name2,                                ~student_name3,                         ~student_name4,               ~student_name5,               ~student_name6,             ~student_name7,
  "Hubballi Urban",  "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI",        "Jayashree S Shiraguppi", "Madhumati",      "INS023",     "Rijavanali  N  Vaddo-QYZ174",      "Mustakeem E Nayak-AEF275", "Md gousa Sakalainaraja.  M   Sheradi-DXB584",      "Arshin rayazmahamad shek-D9POCT",                           NA,                           NA,                         NA,
  "Hubballi Urban",  "SCH004", "GLPS S.M.KRISHNA NAGAR HUBLI",                        "Nithin", "Madhumati",      "INS023", "Mahamad jubera M  Hakeem-5O7VJP", "Khajagareeb  N  Chouri-56NTB1",               "Sarafaraj M Shirahatti-R4ERTZ", "Madiya mahamad gous mundaragi-34O6KT",                           NA,                           NA,                         NA,
  "Dharwad Rural",  "SCH006",          "GLPS DADDIKAMALAPUR", "Jayashree Shrishail Kambimath", "Madhumati",      "INS014",     "Preetham A Dandewale-MSO547",     "Rithesh U Dalewale-VFQ817",                   "Sameera C Madewale-OZH670",           "Sandhya J Koramaddi-LLK505", "Samarth E Garewalle-NJV716", "Sheetal P Madewalle-OLN920", "Vijay S Khanewale-XGT339",
  "Hubballi Rural",  "SCH007",             "GHPS SULLA HUBLI",        "Anpurna C Police patil",      "Anil",      "INS013",         "shridhar s katti-HJK525",       "shreyas M Naykar-GKS383",                "Manoja S mangoniyavar-BWT967",              "Jyoti I  sogalad-IQS051",                           NA,                           NA,                         NA,
  "Hubballi Rural",  "SCH007",             "GHPS SULLA HUBLI",                        "Ganesh",      "Anil",      "INS013",       "Vaishnavi.shivalli-CLPP6B",       "Sufiya Hasansabh-PFMBPU",                "Pranav prakash Asundi-GJHILQ",     "VijayKumar  M  pashupatti-AIE697",                           NA,                           NA,                         NA
)

data1 |> 
  group_by(school_code) |>
  mutate(student_nr = paste('student',row_number(),sep = '_')) |>
  ungroup() |>
  select(-s.no) |>
  pivot_wider(names_from = student_nr, values_from = child_name_scto) |> View()
