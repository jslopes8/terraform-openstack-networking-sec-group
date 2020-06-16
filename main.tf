resource "openstack_networking_secgroup_v2" "secgroup" {
    name        = "${var.name}"
    description = "${var.description}"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule" {
    count   =   var.create_sg ? length(var.security_group_rule) : 0
    
    security_group_id   = "${openstack_networking_secgroup_v2.secgroup.id}"
    
    direction           = var.security_group_rule[count.index]["direction"]
    ethertype           = var.security_group_rule[count.index]["ethertype"]
    protocol            = var.security_group_rule[count.index]["protocol"]
    port_range_max      = var.security_group_rule[count.index]["port_range_max"]
    port_range_min      = var.security_group_rule[count.index]["port_range_max"]
    remote_ip_prefix    = var.security_group_rule[count.index]["remote_ip_prefix"]
    region              = lookup(var.security_group_rule[count.index], "region", null )
    tenant_id           = lookup(var.security_group_rule[count.index], "tenant_id", null)
} 

resource "openstack_networking_secgroup_rule_v2" "secgroup_remote" {
    count   =   var.create_sg ? length(var.security_group_remote) : 0

    security_group_id   = "${openstack_networking_secgroup_v2.secgroup.id}"

    direction           = var.security_group_rule[count.index]["direction"]
    ethertype           = var.security_group_rule[count.index]["ethertype"]
    protocol            = var.security_group_rule[count.index]["protocol"]
    port_range_max      = var.security_group_rule[count.index]["port_range_max"]
    port_range_min      = var.security_group_rule[count.index]["port_range_max"]
    remote_ip_prefix    = var.security_group_rule[count.index]["remote_ip_prefix"]
    remote_group_id     = var.security_group_rule[count.index]["remote_group_id"]
    region              = lookup(var.security_group_rule[count.index], "region", null )
    tenant_id           = lookup(var.security_group_rule[count.index], "tenant_id", null)
}
