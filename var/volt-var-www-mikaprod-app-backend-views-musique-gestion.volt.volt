<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <?= $this->tag->getTitle() ?>
        <?= $this->assets->outputCss() ?>
        <link href="/css/admin/font-awesome.css" rel="stylesheet" type="text/html">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.js"></script>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.1.1/dropzone.css" rel="stylesheet" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.1.1/dropzone.js"></script>
        <script>
            Dropzone.options.myAwesomeDropzone = {
                init: function () {
                    this.on("success", function (file) {
                        var ext = checkFileExt(file.name);  // Get extension
                        var newimage = "";
                        console.log('ext : ' + ext);
                        // Check extension
                        if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
                            newimage = "http://creativejunkie.fr/wp-content/uploads/2015/09/g-by-google.png";   // default image path
                        }
                        myAwesomeDropzone.createThumbnailFromUrl(file, newimage);
                    });
                }
            };

            // Get file extension
            function checkFileExt(filename) {
                filename = filename.toLowerCase();
                return filename.split('.').pop();
            }

        </script>
        <!-- <script>
            Dropzone.autoDiscover = false;


            // Get file extension
            function checkFileExt(filename) {
                filename = filename.toLowerCase();
                return filename.split('.').pop();
            }
            $(function () {

                $(".dropzone").dropzone({
                    addRemoveLinks: true,
                    init: function () {

                        this.on("success", function (file) {
                            var ext = checkFileExt(file.name); // Get extension
                            var newimage = "";

                            // Check extension

                            if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
                                newimage = "/img/autres/icone/IMG_1193.JPG"; // default image path
                            }
                            this.createThumbnailFromUrl(file, newimage);

                        });
                    },
                    removedfile: function (file) {
                        var name = file.name;

                        $.ajax({
                            type: 'POST',
                            url: 'upload.php',
                            data: {name: name, request: 2},
                            sucess: function (data) {
                                console.log('success: ' + data);
                            }
                        });
                        var _ref;
                        return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                    }
                });
            });
        </script>-->
        
        
    </head>
    <body>
        <?php $session = $this->session->get('phalcon-session'); ?>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Administration</a>    
                </div>
                <!-- Top Menu Items -->         
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                        <ul class="dropdown-menu message-dropdown">
                            <?php $numbers = [1, 2, 3]; ?>
                            <?php foreach ($numbers as $name => $value) { ?>
                                <li class="message-preview">
                                    <a href="#">
                                        <div class="media">
                                            <span class="pull-left">
                                                <img class="media-object" src="" alt="">
                                            </span>
                                            <div class="media-body">
                                                <h5 class="media-heading"><strong> <?= $session['nom'] . ' ' . $session['prenom'] ?></strong>
                                                </h5>
                                                <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            <?php } ?>
                            <li class="message-footer">
                                <a href="#">Lire tous les messages</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                        <ul class="dropdown-menu alert-dropdown">
                            <li>
                                <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                            </li>
                            <li>
                                <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                            </li>
                            <li>
                                <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                            </li>
                            <li>
                                <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                            </li>
                            <li>
                                <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                            </li>
                            <li>
                                <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">View All</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?= $session['nom'] . ' ' . $session['prenom'] ?><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profil</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-envelope"></i> Messagerie</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Paramètre</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="<?= $this->url->get('/deconnexion') ?>"><i class="fa fa-fw fa-power-off"></i> Déconnexion</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active">
                            <a href="<?= $this->url->get('/admin') ?>"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="<?= $this->url->get('/admin/categorie/gestion') ?>"><i class="fa fa-fw fa-list"></i>Catégories</a>
                        </li>
                        <li>
                            <a data-toggle="collapse" data-target="#musique"><i class="fa fa-fw fa-music"></i>Musique<i class="fa fa-fw fa-caret-down"></i></a>
                            <ul id="musique" class="collapse">
                                <li>
                                    <a href="<?= $this->url->get('/admin/musique/ajout') ?>">Ajouter</a>
                                </li>
                                <li>
                                    <a href="<?= $this->url->get('/admin/musique/gestion') ?>">Gestion des musiques</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="<?= $this->url->get('/admin/utilisateur/gestion') ?>"><i class="fa fa-fw fa-edit"></i> Utilisateurs</a>
                        </li>
                        <li>
                            <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                        </li>
                        <li>
                            <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                        </li>

                        <li>
                            <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                        </li>                       
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Gestion des Musiques
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-6">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>
                            Libelle
                        </td>
                        <td>
                            Catégorie
                        </td>
                        <td>
                            Action
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($musiques as $musique) { ?>
                        <tr>
                            <td><?= $musique->libelle ?></td>
                            <td><?= $this->elements->getCategorie($musique->id_categorie) ?></td>
                            <td>
                                <a class="btn btn-primary" href="<?= $this->url->get('/admin/musique/modification/' . $musique->id) ?>" role="button">Modifier</a>
                                <a class="btn btn-danger" href="<?= $this->url->get('/admin/musique/suppression/' . $musique->id) ?>" role="button">Supprimer</a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>

    </div>


                </div>

            </div>
            <!-- /#page-wrapper -->

        </div>

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.js"></script>
        -->   
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <?= $this->assets->outputJs() ?>

    </body>

</html>
