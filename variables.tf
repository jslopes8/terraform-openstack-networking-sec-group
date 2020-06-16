#variable "create_sg" {
#    type    = bool
#    default = true
#}
variable "name" {
    type    = string
}
variable "description" {
    type    = string
    default = ""
}
#variable "security_group_rule" {
#    type    = list(map(string))
#    default = []
#}
#variable "security_group_remote" {
#    type    = list(map(string))
#    default = []
#}

variable "rule" {
    type    = list(map(string))
    default = []
}

