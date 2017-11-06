<!doctype html>
<html lang="fr">
    <head>
        <?= $this->tag->getTitle() ?>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <?= $this->assets->outputCss('style') ?>
            <?= $this->assets->outputCss() ?>
            <?= $this->assets->outputJs('js') ?>

        
    <?= $this->assets->outputCss('additional') ?>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="icon" type="image/jpg" sizes="16x16" href="<?= $this->url->get('img/autres/IMG_0345.JPG') ?>">
    </head> 
    <body>
        <div class="navbar navbar-default nopadding">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?= $this->url->get('/') ?>">MkMusicProd</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<?= $this->url->get('/') ?>">Accueil</a></li>
                        <li><a href="<?= $this->url->get('/a-propos') ?>">A propos</a></li>
                        <li><a href="<?= $this->url->get('/contact') ?>">Contactez-nous</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<?= $this->url->get('/connexion') ?>">Se connecter</a></li>
                        <li><a href="<?= $this->url->get('/creer-compte') ?>">Creer un compte</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
     <?= $this->flashSession->output() ?>
    <div class="container-fluid">
        <section class="container">
            <div class="container-page">	
                <form method="post" action="<?= $this->url->get('signup/doSignup') ?>">

                    <div class="col-md-6 col-xs-12 col-md-offset-3">

                        <h3 class="dark-grey">Inscription</h3>

                        <div class="form-group col-lg-12">
                            <label>Email*</label>
                            <input type="email" name="email" class="form-control" required="required">
                        </div>	
                        <div class="form-group col-lg-6">
                            <label>Mot de passe*</label>
                            <input type="password" name="password" class="form-control" required="required">
                        </div>

                        <div class="form-group col-lg-6">
                            <label>Répeter le mot de passe*</label>
                            <input type="password" name="password-confirm" class="form-control" required="required">
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Nom</label>
                            <input type="text" name="nom" class="form-control" >
                        </div>
                        <div class="form-group col-lg-6">
                            <label>Prénom</label>
                            <input type="text" name="prenom" class="form-control" >
                        </div>




                        <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>" >
                        <div class="form-group col-lg-12">
                            <input class="btn btn-lg btn-primary btn-block" type="submit" value="Créer un compte">
                        </div>	

                    </div>
                </form>

            </div>
        </section>
    </div>

    </body>
     <?= $this->assets->outputJs() ?>
</html>  