<?php
session_start();
include 'php/config.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Videos - GymBuddy</title>
    <link rel="stylesheet" href="css/styletest.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="trainers.php">Trainers</a></li>
                <li><a href="videos.php">Videos</a></li>
                <li><a href="about.php">About Us</a></li>
                <?php if(isset($_SESSION['user_id'])): ?>
                    <?php if(isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'admin'): ?>
                        <li><a href="php/admin_dashboard.php">Admin Dashboard</a></li>
                    <?php elseif(isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'trainer'): ?>
                        <li><a href="php/trainer_dashboard.php">Trainer Dashboard</a></li>
                    <?php elseif(isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'user'): ?>
                        <li><a href="php/user_dashboard.php">My Bookings</a></li>
                    <?php endif; ?>
                    <li><a href="php/logout.php">Logout</a></li>
                <?php else: ?>
                    <li><a href="php/login.php">Login</a></li>
                    <li><a href="php/signup.php">Sign Up</a></li>
                <?php endif
?> 
            </ul>
        </nav>
    </header>
    <section class="about" id="about">



<div class="row">


   <div class="content">
        <h3>Workout Videos</h3>
        <p>
        Explore our collection of workout videos created by our expert trainers. Each video demonstrates proper techniques and exercises, offering valuable guidance to help you reach your fitness goals. Whether you're a beginner or looking to refine your skills, these videos are here to inspire and support your fitness journey!</p>
      
   </div>
</div>


</section>
<section class="trainers">

<h1 class="heading">Sample Videos</h1>


</section>
    <main class="videos-page">
  
        <div class="video-grid">
            <div class="video">
                <h2>Bench Press Workout</h2>
                <p>by Exequiel Dela Cruz</p>
                <div class="video-container">
                <iframe width="560" height="350" src="https://youtube.com/embed/Oq5fv3dm7fQ?si=Zep3GLa9A88gqhD1&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        Your browser does not support the video tag.
                    </div>
                </div>

<div class="video">
    <h2>Deadlift Workout</h2>
    <p>by Exequiel Dela Cruz</p>
    <div class="video-container">
    <iframe width="560" height="350" src="https://youtube.com/embed/DB1xe3QQ1Lk?si=mI78HEkJ4UssfMFb&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
Your browser does not support the video tag.

    </div>
            </div>

            <div class="video">
                <h2>Squat Workout</h2>
                <p>by Exequiel Dela Cruz</p>
                <div class="video-container">
                <iframe width="560" height="350" src="https://youtube.com/embed/FS3K1hpFvJo?si=-1HKs5jGypEZ1gKO&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


                
                </div>

            </div>
            
            <div class="video">
                
                <h2>Leg Extension Workout</h2>
                <p>by Kenett Villalon</p>
                <div class="video-container">
                <iframe width="560" height="350" src="https://youtube.com/embed/JqoJxXjjgIs?si=V8DtOV-Jw2vmO3DC&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


           
            </div>
            </div>
            <div class="video">
                
                <h2>Dumbell Press Workout</h2>
                <p>by Paulo Lustestica</p>
                <div class="video-container">
                <iframe width="560" height="350" src="https://youtube.com/embed/RfPskMMLE0U?si=gYJFYhR7RBZSo_Or&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


                        </div>
            </div>
            <div class="video">
                
                <h2>Romanian Deadlift Workout</h2>
                <p>by Paulo Lustestica</p>
                <div class="video-container">
                <iframe width="560" height="350" src="https://youtube.com/embed/zubNu9Mj5-M?si=vqOQICA8zHMTn_ba&rel=0" title="YouTube video player" frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" 
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


           
            </div>
    
        </div>
    </main>
    
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="trainers.php">Trainers</a></li>
                    <li><a href="videos.php">Videos</a></li>
                    <li><a href="about.php">About Us</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: Gymbuddy@gmail.com</p>
                <p>Phone: +93 960 456 6595</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 GymBuddy. All rights reserved.</p>
        </div>
    </footer>
    <a href="index.php" class="back-to-home">Back to Home</a>
    

    <script src="js/script.js"></script>
</body>
</html>

