<!doctype html>
<html lang="fr">
    <head>
        {{ get_title()}}
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        {{assets.outputCss('style')}}
        {{assets.outputJs('js')}}
        {% block head %}
        {% endblock %}
    </head>
    <body>
        <div class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Phalcon</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="{{ url("/") }}">Home</a></li>
                        <li><a href="{{ url("/a-propos") }}">A propos</a></li>
                        <li><a href="{{ url("/contactez-nous") }}">Contactez-nous</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="{{ url("/deconnexion") }}">Se déloguer</a></li>
                    </ul>
                </div>
            </div>
        </div>
        {% block content %}
        {% endblock %}
    </body>
</html>  