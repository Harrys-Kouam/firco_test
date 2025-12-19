resource "local_file" "config" {
  filename = "${path.module}/config.txt"

  content = "${local.team_name}-${local.activity}"
}
