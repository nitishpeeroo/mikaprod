{% extends "templates/base.volt" %}
{% block head %}
    {{assets.outputCss('additional')}}
{% endblock %}
{% block content %}
        {{ flash.output() }}
    <form class="form-signin" method="post" action="{{ url('connexion/verification')}}">
        <h2 class="form-signin-heading">    Connexion</h2>
        <label for="inputEmail" class="sr-only">Adresse email</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Adresse email" required autofocus>
        <label for="inputPassword" class="sr-only">Mot de passe</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Mot de passe" required>
       <input type="hidden" name="{{ security.getTokenKey()}}" value="{{ security.getToken()}}" >
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Se connecter">
    </form>
{% endblock %}