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
        
    <div class="col-xs-12 col-sm-9 nopadding">
        <div style="height:420px; overflow: visible;background-color: green;" >

        </div>
        <div style="float:left;width: 100%; background-color: yellow;">
            <div class="col-xs-12 col-sm-3" style="height:140px; background-color: red;" >

            </div>
            <div class="col-xs-12 col-sm-6" style="min-height:140px; background-color: black;">

            </div>
            <div class="col-xs-12 col-sm-3" style="min-height:140px; background-color: maroon;">

            </div>
        </div>
        <!-- Espace commentaire-->
        <style>
            @media (max-width: 480px) {
                .note{
                    display: none;
                }
            }
        </style>
        <div style="float:left;width: 100%; ">

            <div class="col-xs-12" style="float:left;background-color: orange;">
                <textarea class="form-control" name="comment" id="comment" placeholder="Vous devez vous connecter pour écrire un commentaire" style="margin:20px; height: 100px;resize: none;width: 90%;"></textarea>
            </div>
            <div class="col-xs-12 nopadding" style="background-color:rgba(0,0,0,0.05);">
                <div class="col-xs-3 col-md-2">
                    <div style="height:75px;border-radius: 500px;
                         padding-left: 0px;
                         padding-right: 0px;
                         overflow: hidden;
                         width: 75px;
                         box-shadow: 0 0 4px #fff;
                         border: 1px solid hsla(0,0%,100%,.1);margin: 8px;">
                        <img src="http://www.soonvibes.com/static/images/default/avatar.png"  style="display:inline-block;vertical-align: middle; box-sizing: border-box;height: 100%;">
                        <div>
                        </div>
                    </div>
                </div>
                <div class="note col-xs-2" >
                    <span style=" 
                          margin: 14px;
                          height: 60px;
                          width: 60px;
                          text-align: center;
                          line-height: 5.8rem;
                          font-size: 1.5rem;
                          font-weight: 600;
                          background-color: #aaa;
                          border-radius: 50%;
                          display: block;
                          color: #fff;">10</span>
                </div>
                <div class="col-xs-6 col-xs-offset-1 col-md-8 col-md-offset-0" >
                    <div style="margin-bottom:5px;margin-top:5px;">
                        Nitish Peeroo - Il y a 2 minutes
                    </div>
                    <div style="line-height:1.3" >
                        What's going with these people? "répétitif" "lineaire" this is Techno it has to be like that, if you are not aware genre why you make comment? Nice track mate ignore the haters! :D
                    </div>
                </div>
            </div>

            <div class="col-xs-12 nopadding" style="background-color:rgba(0,0,0,0.1);">
                <div class="col-xs-3 col-md-2">
                    <div style="height:75px;border-radius: 500px;
                         padding-left: 0px;
                         padding-right: 0px;
                         overflow: hidden;
                         width: 75px;
                         box-shadow: 0 0 4px #fff;
                         border: 1px solid hsla(0,0%,100%,.1);margin: 8px;">
                        <img src="http://www.soonvibes.com/static/images/default/avatar.png"  style="display:inline-block;vertical-align: middle; box-sizing: border-box;height: 100%;">
                        <div>
                        </div>
                    </div>
                </div>
                <div class="note col-xs-2" >
                    <span style=" 
                          margin: 14px;
                          height: 60px;
                          width: 60px;
                          text-align: center;
                          line-height: 5.8rem;
                          font-size: 1.5rem;
                          font-weight: 600;
                          background-color: #aaa;
                          border-radius: 50%;
                          display: block;
                          color: #fff;">10</span>
                </div>
                <div class="col-xs-6 col-xs-offset-1 col-md-8 col-md-offset-0" >
                    <div style="margin-bottom:5px;margin-top:5px;">
                        Nitish Peeroo - Il y a 2 minutes
                    </div>
                    <div style="line-height:1.3" >
                        What's going with these people? "répétitif" "lineaire" this is Techno it has to be like that, if you are not aware genre why you make comment? Nice track mate ignore the haters! :D
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="col-xs-12 col-sm-3 nopadding" style="height:auto;">
        <div style="float:left;width: 100%;background: #323944;height:auto;">
            <h4 style="font-size:20px; color:white;font-weight: 400;padding:0.1rem;">Mes Titres</h4>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.1rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>

            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:pink;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:pink;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:pink;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:pink;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:pink;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
            <div class="liste-music" style="width: 100%;float:left;clear: both;font-size:0.8rem;padding: 0.2rem;background-color:grey;">
                <div class="col-xs-3 img-music" style="height:70px; background-color: blue;" >
                </div>
            </div>
        </div>
    </div>

    <div class="footer col-xs-12" style="height:300px;background-color: #1295bf;">

    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="js/player/mediaelement-and-player.min.js"></script>
    <link rel="stylesheet" href="css/player.css" media="screen">
    <!-- Audio Player HTML -->
    <div class="audio-player">
        <h1>MkMusicProd - Bébé je t'aime moi</h1>
        <img class="cover" src="/img/musiques/photo.jpg" alt="" style='max-height:100%;'>
        <audio id="audio-player" src="/media/demo.mp3" type="audio/mp3" controls="controls"></audio>
    </div>
    <script>
        $(document).ready(function () {
            $('#audio-player').mediaelementplayer({
                alwaysShowControls: true,
                features: ['playpause', 'volume', 'progress'],
                audioVolume: 'horizontal',
                audioWidth: 400,
                audioHeight: 120
            });
        });
    </script>
    <!-- end Audio Player HTML -->

    </body>
     <?= $this->assets->outputJs() ?>
</html>  