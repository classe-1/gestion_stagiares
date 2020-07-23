<!DOCTYPE html>
<html lang="en">

<head>
    <?php include_once 'views/includes/head.php' ?>
    <title><?= ucfirst($page); ?> login</title>
</head>


<body>
  
<section class="fxt-template-layout9">      
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-3">
                    <div class="fxt-header">
                    <a href="index.php?page=Login"class="fxt-logo  animate__animated animate__flipInY"><img src="assets/images/logo1.png" alt="Logo"></a>
                    </div>                
                </div>                
                <div class="col-lg-6">
                    <div class="fxt-content"> 
                        <h2>Récupérez votre mot de passe</h2>
                        <div class="fxt-form"> 
                            <form method="POST">
                                <div class="form-group"> 
                                    <div class="animate__animated animate__fadeInUp">                                              
                                        <input type="email" id="email" class="form-control" name="email" placeholder="Email" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="animate__animated animate__fadeInUp">  
                                        <button type="submit" class="fxt-btn-fill">Envoie moi un email</button>
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