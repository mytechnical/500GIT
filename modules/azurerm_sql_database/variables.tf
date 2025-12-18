variable "sql_db" {
  type = map(object({
    name=string
   server_id = string
    max_size_gb=string
    tags=optional(map(string))
  }))
}