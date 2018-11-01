case $hostname {
  'puppet': {
    $node_id             = '101'
    $database_host = True
    $database_master = True
    $runway_address = 192.168.1.$node_id
  }
}