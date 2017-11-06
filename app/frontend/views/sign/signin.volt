{% extends "templates/base.volt" %}
{% block head %}
    {{assets.outputCss('additional')}}
{% endblock %}
{% block content %}
    {{ flashSession.output() }}
    <div class="container-fluid">
        <section class="container">
            <div class="container-page">	
                <form method="post" action="{{ url('signin/doSignin')}}">
                    <div class="col-md-6 col-xs-12 col-md-offset-3">
                        <h3 class="dark-grey">Inscription</h3>
                        <div class="form-group col-lg-12">
                            <label>Email*</label>
                            <input type="email" name="email" class="form-control" required="required">
                        </div>	
                        <div class="form-group col-lg-12">
                            <label>Mot de passe*</label>
                            <input type="password" name="password" class="form-control" required="required">
                        </div>
                        <input type="hidden" name="{{ security.getTokenKey()}}" value="{{ security.getToken()}}" >
                        <div class="form-group col-lg-12">
                            <input class="btn btn-lg btn-primary btn-block" type="submit" value="Créer un compte">
                        </div>	
                    </div>
                </form>
            </div>
        </section>
    </div>
{% endblock %}