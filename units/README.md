# Course Content

This folder contains all of the R files used to create the content for this course. 

They are in a convenient R Markdown (RMD) format, so they can be easily edited and knit in order to update lecture notes and assignments as you see fit. 

Most of the RMD files use CSS files to ensure the HTML pages are clean and easy to read. These style sheets all live in the **html** folder and are referenced in the YAML headers of the RMD files. Updating the CSS files will change the style of all of the HTML documents in the repository, but you will need to render all of them for the changes to take effect. 


## Content Map

If you would like to create a content map of all course files contained within the units folder you can use the following R code, setting your working directory to the appropriate path on your computer first. 

```r
## PRINT CONTENT MAP
## library( fs )
## setwd( ".../intro-data-science-TEMPLATE" )
## dir_tree( path="units" )
```

```
units
+-- 00-cheatsheets
|   +-- base-r-cheatsheet.pdf
|   +-- data-wrangling-cheatsheet.pdf
|   +-- dplyr-cheatsheet.pdf
|   +-- latex-formula-syntax.pdf
|   +-- r-markdown-files.html
|   +-- r-markdown-files.rmd
|   +-- r-markdown-files_files
|   |   +-- bootstrap-3.3.5
|   |   |   +-- css
|   |   |   |   +-- bootstrap-theme.css
|   |   |   |   +-- bootstrap-theme.css.map
|   |   |   |   +-- bootstrap-theme.min.css
|   |   |   |   +-- bootstrap.css
|   |   |   |   +-- bootstrap.css.map
|   |   |   |   +-- bootstrap.min.css
|   |   |   |   +-- cerulean.min.css
|   |   |   |   +-- cosmo.min.css
|   |   |   |   +-- darkly.min.css
|   |   |   |   +-- flatly.min.css
|   |   |   |   +-- fonts
|   |   |   |   |   +-- Lato.ttf
|   |   |   |   |   +-- LatoBold.ttf
|   |   |   |   |   +-- LatoItalic.ttf
|   |   |   |   |   +-- NewsCycle.ttf
|   |   |   |   |   +-- NewsCycleBold.ttf
|   |   |   |   |   +-- OpenSans.ttf
|   |   |   |   |   +-- OpenSansBold.ttf
|   |   |   |   |   +-- OpenSansBoldItalic.ttf
|   |   |   |   |   +-- OpenSansItalic.ttf
|   |   |   |   |   +-- OpenSansLight.ttf
|   |   |   |   |   +-- OpenSansLightItalic.ttf
|   |   |   |   |   +-- Raleway.ttf
|   |   |   |   |   +-- RalewayBold.ttf
|   |   |   |   |   +-- Roboto.ttf
|   |   |   |   |   +-- RobotoBold.ttf
|   |   |   |   |   +-- RobotoLight.ttf
|   |   |   |   |   +-- RobotoMedium.ttf
|   |   |   |   |   +-- SourceSansPro.ttf
|   |   |   |   |   +-- SourceSansProBold.ttf
|   |   |   |   |   +-- SourceSansProItalic.ttf
|   |   |   |   |   +-- SourceSansProLight.ttf
|   |   |   |   |   \-- Ubuntu.ttf
|   |   |   |   +-- journal.min.css
|   |   |   |   +-- lumen.min.css
|   |   |   |   +-- paper.min.css
|   |   |   |   +-- readable.min.css
|   |   |   |   +-- sandstone.min.css
|   |   |   |   +-- simplex.min.css
|   |   |   |   +-- spacelab.min.css
|   |   |   |   +-- united.min.css
|   |   |   |   \-- yeti.min.css
|   |   |   +-- fonts
|   |   |   |   +-- glyphicons-halflings-regular.eot
|   |   |   |   +-- glyphicons-halflings-regular.svg
|   |   |   |   +-- glyphicons-halflings-regular.ttf
|   |   |   |   +-- glyphicons-halflings-regular.woff
|   |   |   |   \-- glyphicons-halflings-regular.woff2
|   |   |   +-- js
|   |   |   |   +-- bootstrap.js
|   |   |   |   +-- bootstrap.min.js
|   |   |   |   \-- npm.js
|   |   |   \-- shim
|   |   |       +-- html5shiv.min.js
|   |   |       \-- respond.min.js
|   |   +-- figure-html
|   |   |   +-- unnamed-chunk-1-1.png
|   |   |   \-- unnamed-chunk-2-1.png
|   |   +-- header-attrs-2.14
|   |   |   \-- header-attrs.js
|   |   +-- jquery-1.11.3
|   |   |   \-- jquery.min.js
|   |   +-- jquery-3.6.0
|   |   |   +-- jquery-3.6.0.js
|   |   |   +-- jquery-3.6.0.min.js
|   |   |   \-- jquery-3.6.0.min.map
|   |   \-- navigation-1.1
|   |       +-- codefolding-lua.css
|   |       +-- codefolding.js
|   |       +-- sourceembed.js
|   |       \-- tabsets.js
|   +-- README.md
|   +-- rmarkdown-cheatsheet-2.0.pdf
|   +-- rmarkdown-reference.pdf
|   \-- rstudio-IDE-cheatsheet.pdf
+-- 00-foundations
|   +-- helpful-vocabulary.docx
|   +-- img
|   |   +-- ch-001-image1.jpg
|   |   +-- ch-001-image2.jpg
|   |   +-- ch-001-image3.jpg
|   |   +-- ch-002-image-code_quality.png
|   |   +-- ch-002_image_cheat_sheets.jpg
|   |   +-- ch-002_image_console.jpg
|   |   +-- ch-002_image_devices.jpg
|   |   +-- ch-002_image_devices1.jpg
|   |   +-- ch-002_image_devices2.jpg
|   |   +-- ch-002_image_environment.jpg
|   |   +-- ch-002_image_environment1.jpg
|   |   +-- ch-002_image_environment2.jpg
|   |   +-- ch-002_image_files.jpg
|   |   +-- ch-002_image_files_packages.jpg
|   |   +-- ch-002_image_globaloptions.jpg
|   |   +-- ch-002_image_help.jpg
|   |   +-- ch-002_image_history.jpg
|   |   +-- ch-002_image_menu1.jpg
|   |   +-- ch-002_image_menu2.jpg
|   |   +-- ch-002_image_menu3.jpg
|   |   +-- ch-002_image_options.jpg
|   |   +-- ch-002_image_options2.jpg
|   |   +-- ch-002_image_panes.jpg
|   |   +-- ch-002_image_plot_viewer.jpg
|   |   +-- ch-002_image_rstudio.jpg
|   |   +-- ch-002_image_script.jpg
|   |   +-- ch-002_image_zoom.jpg
|   |   +-- flower.jpg
|   |   +-- heading_formats.jpg
|   |   +-- iframe.png
|   |   +-- keep-calm-and-markdown.png
|   |   +-- knit.png
|   |   +-- knitting.png
|   |   +-- learning-curve-01.png
|   |   +-- learning-curve-02.png
|   |   +-- learning-curve-03.png
|   |   \-- rmd_output_types.png
|   +-- pubs
|   |   +-- data-science-sexiest-job-21st-century.pdf
|   |   \-- r-is-still-hot.pdf
|   +-- r-style-guide.docx
|   +-- README.md
|   +-- topic-00x01-core-r.html
|   +-- topic-00x01-core-r.rmd
|   +-- topic-00x02-rstudio.html
|   +-- topic-00x02-rstudio.Rmd
|   +-- topic-00x03-markdown.html
|   +-- topic-00x03-markdown.rmd
|   +-- topic-00x04-data-driven-docs.html
|   +-- topic-00x04-data-driven-docs.rmd
|   +-- topic-00x05-learning-r.html
|   +-- topic-00x05-learning-r.rmd
|   +-- vid-01-rstudio-tour.mp4
|   +-- vid-02-github-issues.mp4
|   +-- vid-03-markdown.mp4
|   +-- vid-04-data-driven-docs.mp4
|   \-- VideoDecodeStats
|       +-- 000003.log
|       +-- CURRENT
|       +-- LOCK
|       +-- LOG
|       \-- MANIFEST-000001
+-- 01-building-blocks-of-r
|   +-- handout-functions-and-arguments.docx
|   +-- img
|   |   +-- amortization-formula.jpg
|   |   +-- assignment.png
|   |   +-- calculate-amortization.jpg
|   |   +-- data_types.png
|   |   +-- function.png
|   |   \-- vectors.png
|   +-- lab-01-instructions.html
|   +-- lab-01-instructions.rmd
|   +-- lab-01-template.Rmd
|   +-- README.md
|   +-- topic-01x01-objects-and-assignment.Rmd
|   +-- topic-01x02-functions.html
|   +-- topic-01x02-functions.rmd
|   +-- topic-01x03-programming.Rmd
|   +-- topic-01x04-vectors.html
|   +-- topic-01x04-vectors.rmd
|   +-- topic-01x05-data-frames.html
|   +-- topic-01x05-data-frames.rmd
|   +-- topic-01x06-matrices-and-lists.rmd
|   +-- vid-01-objects-and-assignment.mp4
|   +-- vid-02-functions.mp4
|   \-- vid-03-vectors.mp4
+-- 02-operators-and-descriptives
|   +-- data
|   |   +-- syr_parcels.csv
|   |   \-- syr_parcels.geojson
|   +-- img
|   |   +-- bearded_men.png
|   |   +-- compound_logical_statements.png
|   |   +-- download.png
|   |   +-- downtown_syr.png
|   |   +-- group_selection.png
|   |   +-- Land Use.pdf
|   |   +-- Land_Use.png
|   |   \-- Syracuse_Parcels.png
|   +-- lab-02-data-dictionary-syr-parcels.html
|   +-- lab-02-data-dictionary-syr-parcels.rmd
|   +-- lab-02-instructions.html
|   +-- lab-02-instructions.rmd
|   +-- lab-02-template.rmd
|   +-- practice-02x01-logical-statements.pdf
|   +-- practice-02x01-logical-statements.R
|   +-- README.md
|   +-- topic-02x01-operators.html
|   +-- topic-02x01-operators.rmd
|   +-- topic-02x02-groups.html
|   +-- topic-02x02-groups.rmd
|   +-- vid-02x01-operators.mp4
|   \-- vid-02x02-vectors.mp4
+-- 03-data-viz-static
|   +-- img
|   |   +-- anatomy_of_a_graph3.png
|   |   +-- ch-102-ggplot2.rmd
|   |   +-- ch-102-ggplot2_cache
|   |   |   \-- html
|   |   |       +-- unnamed-chunk-10_f96980c13a6630aae2c7303a8d90209b.RData
|   |   |       +-- unnamed-chunk-10_f96980c13a6630aae2c7303a8d90209b.rdb
|   |   |       +-- unnamed-chunk-10_f96980c13a6630aae2c7303a8d90209b.rdx
|   |   |       +-- unnamed-chunk-11_6bd9b326bf8b50b37b1071f56ab441aa.RData
|   |   |       +-- unnamed-chunk-11_6bd9b326bf8b50b37b1071f56ab441aa.rdb
|   |   |       +-- unnamed-chunk-11_6bd9b326bf8b50b37b1071f56ab441aa.rdx
|   |   |       +-- unnamed-chunk-13_efd5d6ef22b2a13ce29e7aa754470b62.RData
|   |   |       +-- unnamed-chunk-13_efd5d6ef22b2a13ce29e7aa754470b62.rdb
|   |   |       +-- unnamed-chunk-13_efd5d6ef22b2a13ce29e7aa754470b62.rdx
|   |   |       +-- unnamed-chunk-3_62db6da416e5b10f770fe08f99d05d56.RData
|   |   |       +-- unnamed-chunk-3_62db6da416e5b10f770fe08f99d05d56.rdb
|   |   |       +-- unnamed-chunk-3_62db6da416e5b10f770fe08f99d05d56.rdx
|   |   |       +-- unnamed-chunk-4_b1b9b158cbce349313469f751f83edaa.RData
|   |   |       +-- unnamed-chunk-4_b1b9b158cbce349313469f751f83edaa.rdb
|   |   |       +-- unnamed-chunk-4_b1b9b158cbce349313469f751f83edaa.rdx
|   |   |       +-- unnamed-chunk-5_ef2d99f268efb200ef9fc5e2d8e2a66f.RData
|   |   |       +-- unnamed-chunk-5_ef2d99f268efb200ef9fc5e2d8e2a66f.rdb
|   |   |       +-- unnamed-chunk-5_ef2d99f268efb200ef9fc5e2d8e2a66f.rdx
|   |   |       +-- unnamed-chunk-7_af9fc26b5bbc5f8871d8e7e422e5689c.RData
|   |   |       +-- unnamed-chunk-7_af9fc26b5bbc5f8871d8e7e422e5689c.rdb
|   |   |       +-- unnamed-chunk-7_af9fc26b5bbc5f8871d8e7e422e5689c.rdx
|   |   |       +-- unnamed-chunk-8_40adb3ed4da1b43c7ebe3d148691bb43.RData
|   |   |       +-- unnamed-chunk-8_40adb3ed4da1b43c7ebe3d148691bb43.rdb
|   |   |       +-- unnamed-chunk-8_40adb3ed4da1b43c7ebe3d148691bb43.rdx
|   |   |       +-- unnamed-chunk-9_3bdca52a5312ac567c81151b5bdfe49a.RData
|   |   |       +-- unnamed-chunk-9_3bdca52a5312ac567c81151b5bdfe49a.rdb
|   |   |       +-- unnamed-chunk-9_3bdca52a5312ac567c81151b5bdfe49a.rdx
|   |   |       \-- __packages
|   |   +-- ch-102-ggplot2_files
|   |   |   \-- figure-html
|   |   |       +-- unnamed-chunk-10-1.png
|   |   |       +-- unnamed-chunk-11-1.png
|   |   |       +-- unnamed-chunk-4-1.png
|   |   |       \-- unnamed-chunk-5-1.png
|   |   +-- download.png
|   |   +-- eddie_gaedel.png
|   |   +-- essential_layers.jpg
|   |   +-- gapminder_graphic.jpg
|   |   +-- gapminder_visualization.r
|   |   +-- ggplot2_recipe.jpg
|   |   \-- reis_syracuse.jpg
|   +-- lab-03-v1-instructions.rmd
|   +-- lab-03-v1-template.rmd
|   +-- lab-03-v2-instructions.RMD
|   +-- lab-03-v2-template.Rmd
|   +-- practice-03x01-plot.R
|   +-- practice-03x02-plot.R
|   +-- practice-03x03-custom-graphics.R
|   +-- pubs
|   |   +-- BudgetVisualized.R
|   |   +-- Colors in R.R
|   |   +-- gif example.R
|   |   +-- graphical-parameters.docx
|   |   +-- mccandless-information-is-beautiful.pdf
|   |   +-- plot-commands-short.docx
|   |   +-- plot-commands.docx
|   |   +-- schwabish-data-viz-for-economists.pdf
|   |   +-- Subway Style Rank.R
|   |   +-- Swarming Animation.r
|   |   +-- Text in Margins.R
|   |   \-- xkcd-stickfigure-example.R
|   +-- README.md
|   +-- topic-03x00-image-formats.pdf
|   +-- topic-03x00-image-formats.pptx
|   +-- topic-03x00-tips-for-data-viz.pdf
|   +-- topic-03x00-tips-for-data-viz.pptx
|   +-- topic-03x01-intro-to-data-viz.html
|   +-- topic-03x01-intro-to-data-viz.rmd
|   +-- topic-03x02-plotting-basics.rmd
|   +-- topic-03x03-custom-graphs-example.html
|   +-- topic-03x03-custom-graphs-example.rmd
|   +-- topic-03x03-custom-graphs.rmd
|   \-- topic-03x04-ggplot2.Rmd
+-- 04-data-viz-dynamic
|   +-- demo-shiny-01.Rmd
|   +-- demo-shiny-02.Rmd
|   +-- demo-shiny-03.Rmd
|   +-- Lab-04-LastName-all-v3.zip
|   +-- lab-04a-instructions.html
|   +-- lab-04a-instructions.rmd
|   +-- lab-04a-template.rmd
|   +-- lab-04b-instructions.rmd
|   +-- lab-04b-templates
|   |   +-- Lab Assignment - Flexdashboard Template.Rmd
|   |   +-- Lab Assignment - Shiny Dashboard Plus Template.R
|   |   \-- Lab Assignment - Shiny Template.R
|   +-- README.md
|   +-- topic-04x01-shiny-widgets.pdf
|   +-- topic-04x01-shiny-widgets.pptx
|   \-- Video - Introducing Shiny.mp4
+-- 05-data-wrangling
|   +-- img
|   |   +-- arrange.png
|   |   +-- chaining_data_verbs.png
|   |   +-- dataset_verbs.png
|   |   +-- data_recipe.png
|   |   +-- data_verbs.png
|   |   +-- data_verb_input_output.png
|   |   +-- download.png
|   |   +-- filter.png
|   |   +-- group_plus_function.png
|   |   \-- select.png
|   +-- lab-05-instructions.rmd
|   +-- lab-05-template.Rmd
|   +-- practice-05-data-verbs-dplyr.R
|   +-- README.md
|   +-- topic-05x01-data-verbs.rmd
|   +-- topic-05x02-group-by.rmd
|   +-- topic-05x03-data-recipes-w-piping.rmd
|   \-- topic-05x04-tidy-data.rmd
+-- 06-data-joins
|   +-- img
|   |   +-- compound_ids.png
|   |   +-- download.png
|   |   +-- inner_join.png
|   |   +-- left_join.png
|   |   +-- outer_join.png
|   |   +-- right_join.png
|   |   \-- shared_observations.png
|   +-- lab-06-instructions.rmd
|   +-- lab-06-template.Rmd
|   +-- README.md
|   +-- topic-06x01-data-joins.rmd
|   \-- topic-06x02-data-binds.Rmd
+-- 07-dashboards
|   +-- demo-flexdashboard-column-orientation.html
|   +-- demo-flexdashboard-column-orientation.Rmd
|   +-- demo-flexdashboard-three-window-layout.html
|   +-- demo-flexdashboard-three-window-layout.Rmd
|   +-- img
|   |   \-- download.png
|   +-- lab-07-dashboard-template-v1.rmd
|   +-- lab-07-dashboard-template-v2.rmd
|   +-- lab-07-dashboard-template-v3.Rmd
|   +-- lab-07-instructions.html
|   +-- lab-07-instructions.rmd
|   +-- practice-07x01-flexdashboard.Rmd
|   +-- practice-07x02-flexdashboard.Rmd
|   +-- practice-07x03-shiny.R
|   +-- practice-07x04-shiny-plus.R
|   +-- README.md
|   \-- topic-07x01-flexdashboards.Rmd
+-- data
|   +-- BabyNames.csv
|   +-- BabyNames.rds
|   +-- CASchools.R
|   +-- census_population_2000_and_2010.csv
|   +-- corn_stalks.R
|   +-- create_nonprofit_dataset.R
|   +-- data-state-x77-life-expectancy-usa.csv
|   +-- download_tempe_traffic_data.R
|   +-- downtown-syr.geojson
|   +-- get_census_data.html
|   +-- get_census_data.Rmd
|   +-- life-expectancy-raw.csv
|   +-- life-expectancy-who.html
|   +-- life-expectancy-who.rmd
|   +-- life-expectancy-who_files
|   |   +-- bootstrap-3.3.5
|   |   |   +-- css
|   |   |   |   +-- bootstrap-theme.css
|   |   |   |   +-- bootstrap-theme.css.map
|   |   |   |   +-- bootstrap-theme.min.css
|   |   |   |   +-- bootstrap.css
|   |   |   |   +-- bootstrap.css.map
|   |   |   |   +-- bootstrap.min.css
|   |   |   |   +-- cerulean.min.css
|   |   |   |   +-- cosmo.min.css
|   |   |   |   +-- flatly.min.css
|   |   |   |   +-- fonts
|   |   |   |   |   +-- Lato.ttf
|   |   |   |   |   +-- LatoBold.ttf
|   |   |   |   |   +-- LatoItalic.ttf
|   |   |   |   |   +-- NewsCycle.ttf
|   |   |   |   |   +-- NewsCycleBold.ttf
|   |   |   |   |   +-- OpenSans.ttf
|   |   |   |   |   +-- OpenSansBold.ttf
|   |   |   |   |   +-- OpenSansBoldItalic.ttf
|   |   |   |   |   +-- OpenSansItalic.ttf
|   |   |   |   |   +-- OpenSansLight.ttf
|   |   |   |   |   +-- OpenSansLightItalic.ttf
|   |   |   |   |   +-- Raleway.ttf
|   |   |   |   |   +-- RalewayBold.ttf
|   |   |   |   |   +-- Roboto.ttf
|   |   |   |   |   +-- RobotoBold.ttf
|   |   |   |   |   +-- RobotoLight.ttf
|   |   |   |   |   +-- RobotoMedium.ttf
|   |   |   |   |   +-- SourceSansPro.ttf
|   |   |   |   |   +-- SourceSansProBold.ttf
|   |   |   |   |   +-- SourceSansProItalic.ttf
|   |   |   |   |   +-- SourceSansProLight.ttf
|   |   |   |   |   \-- Ubuntu.ttf
|   |   |   |   +-- journal.min.css
|   |   |   |   +-- lumen.min.css
|   |   |   |   +-- paper.min.css
|   |   |   |   +-- readable.min.css
|   |   |   |   +-- sandstone.min.css
|   |   |   |   +-- simplex.min.css
|   |   |   |   +-- spacelab.min.css
|   |   |   |   +-- united.min.css
|   |   |   |   \-- yeti.min.css
|   |   |   +-- fonts
|   |   |   |   +-- glyphicons-halflings-regular.eot
|   |   |   |   +-- glyphicons-halflings-regular.svg
|   |   |   |   +-- glyphicons-halflings-regular.ttf
|   |   |   |   +-- glyphicons-halflings-regular.woff
|   |   |   |   \-- glyphicons-halflings-regular.woff2
|   |   |   +-- js
|   |   |   |   +-- bootstrap.js
|   |   |   |   +-- bootstrap.min.js
|   |   |   |   \-- npm.js
|   |   |   \-- shim
|   |   |       +-- html5shiv.min.js
|   |   |       \-- respond.min.js
|   |   +-- figure-html
|   |   |   +-- unnamed-chunk-3-1.png
|   |   |   +-- unnamed-chunk-5-1.png
|   |   |   \-- unnamed-chunk-5-2.png
|   |   +-- jquery-1.11.3
|   |   |   \-- jquery.min.js
|   |   \-- navigation-1.1
|   |       +-- codefolding.js
|   |       +-- sourceembed.js
|   |       \-- tabsets.js
|   +-- life-expectancy.csv
|   +-- msa_fips_crosswalk.csv
|   +-- NationalNames.csv.zip
|   +-- nonprofits_2000.csv
|   +-- nonprofits_2000_2010.csv
|   +-- nonprofits_2010.csv
|   +-- README.md
|   +-- syr_parcels.csv
|   +-- syr_parcels.geojson
|   +-- syr_parcels.html
|   +-- syr_parcels.rds
|   +-- syr_parcels.Rmd
|   +-- syr_parcels_files
|   |   \-- figure-html
|   +-- TempeTrafficAccidents.csv
|   +-- TempeTrafficAccidents.rds
|   +-- TempeTrafficAccidentsDataDictionary.csv
|   \-- wooldridge-hprice3.csv
\-- html
    +-- footer.html
    +-- lab-instructions.css
    +-- lab-solutions.css
    +-- lecture-notes.css
    \-- ps1-gray.png
```
