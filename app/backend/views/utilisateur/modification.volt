
{% extends "templates/admin.volt" %}
{% block content %}
    <div class="row">
        <div class="col-lg-10">
            <h1 class="page-header">
                <a  class="btn btn-primary" href="{{url('/admin/utilisateur/gestion')}}" role="button" >Retour</a>
                Modification d'un utilisateur
            </h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">

            <form class="form" action="{{ url("/admin/utilisateur/modification/"~utilisateur.id) }}" method="post">
                <input type="hidden" value="{{utilisateur.id}}" class="form-control" name="id" autocomplete="off" required="required"> 

                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="name">Nom</label>
                            <input type="text" value="{{utilisateur.nom}}" class="form-control" name="nom" autocomplete="off" required="required"> 
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="parent">Prénom</label>
                            <input type="text" value="{{utilisateur.prenom}}" class="form-control" name="prenom" autocomplete="off" required="required"> 
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="parent">E-mail</label>
                            <input type="email" value="{{utilisateur.email}}" class="form-control" name="email" autocomplete="off" required="required"> 
                        </div>
                    </div>

                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg" type="submit" >Valider</button>
                </div>



            </form>
        </div>
    </div>


{% endblock %}
