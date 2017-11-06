{% extends "templates/admin.volt" %}
{% block content %}
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h2>Ajout d'un utilisateur</h2>
            <hr/>
            <p>Le mot de passe sera crée de manière automatique et envoyé à l'utilisateur</p>
            <form class="form" action="{{ url("/admin/utilisateur/gestion/") }}" method="post">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="name">Nom</label>
                            <input type="text" class="form-control" name="nom" autocomplete="off" required="required"> 
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="parent">Prénom</label>
                            <input type="text" class="form-control" name="prenom" autocomplete="off" required="required"> 
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="parent">E-mail</label>
                            <input type="email" class="form-control" name="email" autocomplete="off" required="required"> 
                        </div>
                    </div>

                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg" type="submit" >Valider</button>
                </div>



            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Gestion des Utilisateurs
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-6">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>
                            Nom
                        </td>
                        <td>
                            Prénom
                        </td>
                        <td>
                            Email
                        </td>
                        <td>
                            Action
                        </td>
                    </tr>
                </thead>
                <tbody>
                    {% for utilisateur in utilisateurs %}
                        <tr>
                            <td>{{utilisateur.nom}}</td>
                            <td>{{ utilisateur.prenom}}</td>
                            <td>{{ utilisateur.email}}</td>
                            <td>
                                <a class="btn btn-primary" href="{{url("/admin/utilisateur/mot-de-passe-oublier/"~ utilisateur.id)}}" role="button">Régénérer mot de passe</a>
                                <a class="btn btn-primary" href="{{url("/admin/utilisateur/modification/"~ utilisateur.id)}}" role="button">Modifier</a>
                                <a class="btn btn-danger" href="{{url("/admin/utilisateur/suppression/"~ utilisateur.id)}}" role="button">Supprimer</a>
                            </td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>

    </div>

{% endblock %}
