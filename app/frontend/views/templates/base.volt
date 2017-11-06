<!doctype html>
<html lang="fr">
    <head>
        {{ get_title()}}
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        {{assets.outputCss('style')}}
            {{assets.outputCss()}}
            {{assets.outputJs('js')}}

        {% block head %}
        {% endblock %}
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
        <link rel="icon" type="image/jpg" sizes="16x16" href="{{ url('img/autres/IMG_0345.JPG') }}">
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
                    <a class="navbar-brand" href="{{ url("/") }}">MkMusicProd</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="{{ url("/") }}">Accueil</a></li>
                        <li><a href="{{ url("/a-propos") }}">A propos</a></li>
                        <li><a href="{{ url("/contact") }}">Contactez-nous</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="{{ url("/connexion") }}">Se connecter</a></li>
                        <li><a href="{{ url("/creer-compte") }}">Creer un compte</a></li>
                    </ul>
                </div>
            </div>
        </div>
        {% block content %}
        {% endblock %}
    </body>
     {{assets.outputJs()}}
</html>  