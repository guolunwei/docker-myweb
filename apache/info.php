<pre>
<?PHP
//phpinfo();
//$arr = array("id" => random_int(0000,9999));
foreach (array("REMOTE_ADDR", "REQUEST_METHOD", "HTTP_USER_AGENT", "REQUEST_URI") as $i) {
  $arr[$i] = $_SERVER[$i];
}
if($_SERVER['REQUEST_METHOD']=="POST"){
  $arr += $_POST;
}else{
  $arr += $_GET;
}
print_R($arr);
print_R("php_host: \t".gethostname()."\n");
$n = 0;
$start = 1;
$end = isset($_GET["id"])? $_GET["id"] : 10000 ;
for($num = $start; $num <= $end; $num++) {
    if ( $num == 1 ) continue;
    for ($i = 2; $i <= sqrt($num); $i++) {
        if ($num % $i == 0) continue 2;
    }
    $n++;
}
print_R($n."\n");
?>
