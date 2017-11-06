{% extends "templates/admin.volt" %}
{% block content %}
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Modification de Catégorie
            </h1>
        </div>
        <div class="col-lg-12">
            <a  class="btn btn-primary" href="{{url('/admin/gestion-categories')}}" role="button" >Retour</a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h2>Ajout de catégorie</h2>

            <form class="form" action="{{ url("/admin/update-categories") }}" method="post">
                <div class="row">

                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="name">Nom de la catégorie</label>
                            <input type="text" class="form-control" name="name" required="required" value="{{categorie.categorie}}"> 
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="parent">Catégorie parent</label>
                            <select class="form-control" name="parent">
                                <option value="0">Accueil</option>
                                {% for c in categories %}
                                    {% if categorie.id_categorie == c.id %}
                                        <option selected="selected" value="{{c.id}}">{{c.categorie}}</option>
                                    {% else %}
                                        {% if categorie.id != c.id %}
                                            <option value="{{c.id}}">{{c.categorie}}</option>
                                        {% endif %}
                                    {% endif %}
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


{% endblock %}
