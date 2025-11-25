read_data_meta = function(view_name) {
  jsonlite::read_json(glue::glue("https://healthdata.gov/api/views/{view_name}.json"))
}

last_updated_date = function(view_name) {
  x = read_data_meta(view_name = view_name)
  lubridate::as_datetime( x$rowsUpdatedAt)
}

download_data_csv = function(view_name, destfile = tempfile(fileext = ".csv"),
                             ...) {
  url = glue::glue("https://healthdata.gov/api/views/{view_name}/rows.csv?accessType=DOWNLOAD")
  curl::curl_download(url, destfile = destfile, ...)
  return(destfile)
}
