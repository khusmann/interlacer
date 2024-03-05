library(readr)
library(haven)
library(interlacer)

missing_labels <- c(
  `N/A` = -99,
  REFUSED = -98,
  OMITTED = -97
)

color_labels <- c(
  BLUE = 1,
  RED = 2,
  YELLOW = 3
)

df_spss <- read_csv(
  interlacer_example("colors_coded.csv"),
  col_types = "n"
) |>
  mutate(
    person_id = labelled_spss(
      person_id,
      labels = missing_labels,
      na_range = c(-Inf, 0),
      label = "Person ID"
    ),
    age = labelled_spss(
      age,
      labels = missing_labels,
      na_range = c(-Inf, 0),
      label = "Age"
    ),
    favorite_color = labelled_spss(
      favorite_color,
      labels = c(color_labels, missing_labels),
      na_range = c(-Inf, 0),
      label = "Favorite color"
    )
  )

write_sav(df_spss, "inst/extdata/colors.sav")

df_stata <- read_csv(
  interlacer_example("colors_coded_char.csv"),
  col_types = "c"
) |>
  mutate(
    across(
      everything(),
      \(x) if_else(
        substring(x, 1, 1) == ".",
        tagged_na(substring(x, 2, 2)),
        suppressWarnings(as.double(x))
      )
    ),
    person_id = labelled(person_id, label = "Person ID"),
    age = labelled(age, label = "Age"),
    favorite_color = labelled(
      favorite_color, labels = color_labels, label = "Favorite color"
    )
  )

# Interesting. write_dta does not save veriable label if there are no value
# labels? When this file is read, neither person_id and age have variable
# labels...

write_dta(df_stata, "inst/extdata/colors.dta")
