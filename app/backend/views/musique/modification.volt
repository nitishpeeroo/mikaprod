
{% extends "templates/admin.volt" %}
{% block content %}
    <div class="row">
        <div class="col-lg-10">
            <h1 class="page-header">
                <a  class="btn btn-primary" href="{{url('/admin/musique/gestion')}}" role="button" >Retour</a>

                Modification d'une musique
            </h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">

            <form class="form" action="{{ url("/admin/musique/gestion") }}" method="post">
                <input type="hidden" name="id" value="{{musique.id}}">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="name">Nom de la musique</label>
                            <input type="text" class="form-control" name="name" required="required" value="{{musique.libelle}}"> 
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="form-group">
                            <label for="parent">Catégorie</label>
                            <select class="form-control" name="parent">
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
