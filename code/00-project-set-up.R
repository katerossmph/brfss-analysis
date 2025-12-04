# ---- Create NHANES Project Structure ----

# Define folders
folders <- c(
  "data_raw",
  "data_clean",
  "code",
  "outputs",
  "outputs/figures",
  "outputs/tables",
  "outputs/tableau_extracts",
  "docs",
  "report"
)

# Create folders
sapply(folders, function(f) if (!dir.exists(f)) dir.create(f, recursive = TRUE))


# ---- Create Starter R Scripts ----

scripts <- list(
  "code/01-download-read.R",
  "code/02-cleaning.R",
  "code/03-descriptives.R",
  "code/04-models.R",
  "code/05-multiple_imputation.R",
  "code/06-export-for-tableau.R"
)

invisible(lapply(scripts, file.create))


# ---- Create Documentation Placeholders ----

file.create("docs/codebook.md")
file.create("docs/analysis_plan.md")
file.create("README.md")


# ---- Create .gitignore ----

gitignore_content <- "
# R session files
.Rhistory
.RData
.Ruserdata

# R packages
.Rproj.user/
.Renv/

# renv cache
renv/library/
renv/cache/

# Raw data (never upload)
data_raw/

# Optional:
# data_clean/
"

writeLines(gitignore_content, ".gitignore")


# ---- Initialize Git Repo if git is installed ----

system("git init")

message('Project structure created successfully!')
