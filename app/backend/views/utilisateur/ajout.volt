{% extends "templates/admin.volt" %}
{% block content %}
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Musique
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-6">
            <form action="{{url('/admin/musique/upload')}}" class="dropzone" id="myAwesomeDropzone"></form>   
        </div>
       
    </div>

{% endblock %}