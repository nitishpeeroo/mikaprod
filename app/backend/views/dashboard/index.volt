{% extends "templates/user.volt" %}
{% block content %}
      {{ flashSession.output() }}
    <div class="jumbotron">
        <h1>User index</h1>
      
    </div>
{% endblock %}