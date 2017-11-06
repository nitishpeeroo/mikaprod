{% extends "templates/admin.volt" %}
{% block content %}
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
                    {% for musique in musiques %}
                        <tr>
                            <td>{{musique.libelle}}</td>
                            <td>{{ elements.getCategorie(musique.id_categorie) }}</td>
                            <td>
                                <a class="btn btn-primary" href="{{url("/admin/musique/modification/"~ musique.id)}}" role="button">Modifier</a>
                                <a class="btn btn-danger" href="{{url("/admin/musique/suppression/"~ musique.id)}}" role="button">Supprimer</a>
                            </td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>

    </div>

{% endblock %}
