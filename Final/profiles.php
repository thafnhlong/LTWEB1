<?php 
ob_start();
  require_once 'init.php';
?>
<?php include 'header.php'; ?>
<?php
    if(!$currentUser)
    {
        header('Location: index.php');
        exit();
    }
?>

		<section class="companies-info">
			<div class="container">
				<div class="company-title">
					<h3>All Users</h3>
                </div><!--company-title end-->
				<div class="companies-list">
					<div class="row">
<?php $getalluser = getUsers($currentUser['ID']);
foreach($getalluser as $u){ ?>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
                                <img style="width: 50px;height: 50px;" src="<?php echo getImage($u['ID'],0)[1]?>" alt="">
									<h3><?php echo $u['Name']; ?></h3>
									<h4><?php echo $u['Job']; ?></h4>
									<ul>
<?php
$me2you = isRequest($currentUser['ID'],$u['ID']);
$you2me = isRequest($u['ID'],$currentUser['ID']);
if ($me2you && $you2me){
    $src = "deleteFriend.php?id={$u['ID']}";
    $valueAnchor = "Delete friend";
} elseif ($you2me)
{
    $src = "deleteFriend.php?id={$u['ID']}";
    $valueAnchor = "Decline";
    
?>
                                                <li><a  href="<?php echo $src?>" title="" class="hre"> <?php echo $valueAnchor?></a></li>
<?php    
    $src = "sendRequest.php?id={$u['ID']}";
    $valueAnchor = "Accept";
} elseif ($me2you){
    $src = "deleteRequest.php?id={$u['ID']}";
    $valueAnchor = "Delete your invatation";
} else {
    $src = "sendRequest.php?id={$u['ID']}&s=";
    $valueAnchor = "Add friend";   
}
?>
<?php 
$me_you=isfollow($currentUser['ID'],$u['ID']);
if($me_you ){
    $valueFL="UnFollow";
    $srcfl="deleteFollowing.php?id={$u['ID']}";
}
else
{
    $valueFL="Follow";
    $srcfl="sendFollowing.php?id={$u['ID']}&s=";
}
?>
												<li>
                                                    <a href="<?php echo $src?>" title="" class="flww"><i class="la la-plus"></i> <?php echo $valueAnchor?></a>                                                    
                                                </li>
                                                <li style="display: block;">
                                                <a style="margin-top:10px;" href="<?php echo $srcfl?>" title="" class="flww"><i class="la la-plus"></i> <?php echo $valueFL?></a>
                                                </li>
									</ul>
								</div>
								<a href="profile.php?id=<?php echo $u['ID'];?>" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
<?php } ?>
					</div>
                </div><!--companies-list end-->

			</div>
		</section><!--companies-info end-->


<?php 
include 'footer.php'; 

