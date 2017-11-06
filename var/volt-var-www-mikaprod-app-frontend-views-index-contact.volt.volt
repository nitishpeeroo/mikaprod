<!doctype html>
<html lang="fr">
    <head>
        <?= $this->tag->getTitle() ?>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <?= $this->assets->outputCss('style') ?>
            <?= $this->assets->outputCss() ?>
            <?= $this->assets->outputJs('js') ?>

        
        
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
        
    <div class="jumbotron">
        <h1>Contact nous </h1>
    </div>

    </body>
     <?= $this->assets->outputJs() ?>
</html>  