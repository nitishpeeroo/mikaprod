{% extends "templates/base.volt" %}

{% block content %}
<!-- main wavesurfer.js lib -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.2.3/wavesurfer.min.js"></script>

<div id="waveform" class="col-lg-12"></div>

<div class="container" style="text-align: center">
  <button class="btn btn-primary" onclick="wavesurfer.playPause()">
    <i class="glyphicon glyphicon-play"></i>
    Play/Pause
  </button>

  
</div>


<script src="http://mikaprod.nitishpeeroo.fr/js/wavesurfer/script.js"></script>
{% endblock %}
