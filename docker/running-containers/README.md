# Check and count running rootless Docker containers

If you have multiple users and each is running it's own rootless daemons, you can check all running containers from all users and count them.

```
root@docker-servers-vlan:~# ./running_containers.sh
USER                           TYPE    CONTAINER_ID   NAME                           STATUS
homarr                         Stack   31444004f924   diun                           Up 2 hours
homarr                         Stack   f873a2cf1357   homarr                         Up 2 hours (healthy)
homarr                         Stack   b21f92674c7f   nginx                          Up 2 hours
linkwarden                     Stack   2bb09d8a8cf1   linkwarden-linkwarden-1        Up 2 days
linkwarden                     Stack   1311453a0e29   nginx_linkwarden               Up 2 days
linkwarden                     Stack   dcd8710eb3ca   diun                           Up 2 days
linkwarden                     Stack   f8956cdb3abc   linkwarden-postgres-1          Up 2 days
netbox                         Stack   fb73978e016e   netbox-netbox-worker-1         Up 2 days (healthy)
netbox                         Stack   da03f99055f4   netbox-netbox-housekeeping-1   Up 2 days (healthy)
netbox                         Stack   2f274209c83d   netbox-netbox-1                Up 2 days (healthy)
netbox                         Stack   93e45c4a1ff7   netbox-postgres-1              Up 2 days
netbox                         Stack   d13539d3929b   netbox-redis-1                 Up 2 days
netbox                         Stack   a57167bd97fb   netbox-redis-cache-1           Up 2 days
netbox                         Stack   03c01b296735   diun                           Up 2 days
netbox                         Stack   01041afec996   nginx_netbox                   Up 2 days
oxidized                       Stack   23a28da9a525   oxidized                       Up 2 days
oxidized                       Stack   b985844a9341   nginx_oxidized                 Up 2 days
oxidized                       Stack   58f13c81e86e   diun_oxidized                  Up 2 days
uptime-kuma                    Stack   c2657d757cbb   uptime-kuma                    Up 2 days (healthy)
uptime-kuma                    Stack   38d3b05650e0   nginx_uptime-kuma              Up 2 days
uptime-kuma                    Stack   0c72f56841d7   diun                           Up 2 days
vaultwarden                    Stack   c37a94634fbc   vaultwarden                    Up 2 days (healthy)
vaultwarden                    Stack   20a110c3f39d   diun                           Up 2 days
vikunja                        Stack   db0404f3d75d   nginx_vikunja                  Up 2 days
vikunja                        Stack   77777cc24e76   vikunja                        Up 2 days
vikunja                        Stack   ec76c9d7f1a0   vikunja-db                     Up 2 days (healthy)
vikunja                        Stack   77efad5e394e   diun                           Up 2 days
```
