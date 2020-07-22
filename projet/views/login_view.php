<!DOCTYPE html>
<html lang="en">

<head>
    <?php include_once 'views/includes/head.php' ?>
    <title><?= ucfirst($page); ?></title>
</head>


<body>
  
<section class="fxt-layout">      
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-3">
                    <div class="fxt-header">
                       <img src="assets/images/logo.png" alt="Logo">
                    </div>                
                </div>                
                <div class="col-lg-6">
                    <div class="fxt-content"> 
                        <h2>Connectez-vous à votre compte</h2>
                        <div class="fxt-form"> 
                            <form method="POST">
                                <div class="form-group"> 
                                    <div class="fxt-transformY-50 fxt-transition-delay-1">                                              
                                        <input type="email" id="email" class="form-control" name="email" placeholder="Email" required="required">
                                    </div>
                                </div>
                                <div class="form-group">  
                                    <div class="fxt-transformY-50 fxt-transition-delay-2">                                              
                                        <input id="password" type="password" class="form-control" name="password" placeholder="********" required="required">
                                        <i toggle="#password" class="fa fa-fw fa-eye toggle-password field-icon"></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-3">  
                                        <div class="fxt-checkbox-area">
                                            <div class="checkbox">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">Rester connecté</label>
                                            </div>
                                            <a href="forgot-password.php" class="switcher-text">Mot de passe oublié</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-4">  
                                        <button type="submit" class="fxt-btn-fill">Connecter</button>
                                    </div>
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    

<?php include_once 'views/includes/footer.php'; ?>
</body>



</html>