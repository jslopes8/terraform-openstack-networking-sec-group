output "sg_name" {
    value   = openstack_compute_secgroup_v2.secgroup.*.name
}
output "sg_id" {
    value   = openstack_compute_secgroup_v2.secgroup.*.id
}
