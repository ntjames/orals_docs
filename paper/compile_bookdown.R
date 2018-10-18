out_dir<-file.path(getwd(),"output")

## html gitbook
bookdown::render_book("index.Rmd", "bookdown::gitbook", output_dir = out_dir)

## pdf
bookdown::render_book("index.Rmd", "bookdown::pdf_book", output_dir = out_dir)


## word doc
#bookdown::render_book("index.Rmd", "bookdown::word_document2", output_dir = out_dir)
