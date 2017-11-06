{% extends "templates/admin.volt" %}
{% block content %}
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Catégorie
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h2>Ajout de catégorie</h2>
            <form class="form" action="{{ url("/admin/gestion-categories") }}" method="post">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="name">Nom de la catégorie</label>
                            <input type="text" class="form-control" name="name" required="required"> 
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="parent">Catégorie parent</label>
                            <select class="form-control" name="parent">
                                <option value="0">Accueil</option>
                                {% for categorie in categories %}
                                    <option value="{{categorie.id}}">{{categorie.categorie}}</option>
                                {%endfor %}
                            </select>
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

        <div class="col-lg-12 ">
            <h2>Gestion de catégorie</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <td>
                            Nom de la catégorie
                        </td>
                        <td>
                            Action
                        </td>
                    </tr>
                </thead>
                <tbody>
                    {% for categorie in categories %}
                        <tr>
                            <td>{{categorie.categorie}}</td>
                            <td>
                                <a class="btn btn-primary" href="{{url("/admin/update-categorie/"~ categorie.id)}}" role="button">Modifier</a>
                                <a class="btn btn-danger" href="{{url("/admin/delete-categorie/"~ categorie.id)}}" role="button">Supprimer</a>
                            </td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
    </div>

{% endblock %}