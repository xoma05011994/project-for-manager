// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
// = require jquery.ui.datepicker
//= require twitter/bootstrap
//= require_tree .
//= require jquery.validate
//= require jquery.validate.additional-methods





$(document).ready(function() 
{

	$(".project_id").dblclick(function()
  {
    var project_id = $(this).attr('project-id');
    console.log(project_id);
    $.ajax
    ({
      type: 'POST',
      url: 'project/update',
      data: {project_id: project_id},
      success: function(html)
      {
        $(".modalwindow").html(html);
        $("#Update").modal('show');
        datepick();
        update_validate();
      }
    });

  });

  $(".client_id").dblclick(function()
  {
    var client_id = $(this).attr('client-id');
    console.log(client_id);
    $.ajax
    ({
      type: 'POST',
      url: 'update',
      data: {client_id: client_id},
      success: function(html)
      {
        $(".modalwindow").html(html);
        $("#Update").modal('show');
        update_validate();
      }
    });

  });

  $(".manager_id").dblclick(function()
  {
    var manager_id = $(this).attr('manager-id');
    console.log(manager_id);
    $.ajax
    ({
      type: 'POST',
      url: 'update',
      data: {manager_id: manager_id},
      success: function(html)
      {
        $(".modalwindow").html(html);
        $("#Update").modal('show');
        update_validate();
      }
    });

  });

    $(".programmer_id").dblclick(function()
  {
    var programmer_id = $(this).attr('programmer-id');
    $.ajax
    ({
      type: 'POST',
      url: 'update',
      data: {programmer_id: programmer_id},
      success: function(html)
      {
        $(".modalwindow").html(html);
        $("#Update").modal('show');
        update_validate();
      }
    });

  });

  $("#a_Add").click(function()
  {
    console.log("sldk");
    $("#Add").modal('show');
  });

  function datepick()
  {
    $(function() 
    {
      $('.datepicker').datepicker( { dateFormat: "yy-mm-dd" } )

    });
  }

  jQuery.validator.setDefaults
  ({
    debug: true,
    success: "valid"
  });

  $.validator.addMethod("endDate", function(value, element) 
  {
    var startDate = $('.date-of-start').val();
    return Date.parse(startDate) <= Date.parse(value) || value == "";
  }, "* End date must be after start date");

  $.validator.addMethod("deadline", function(value, element) 
  {
    return /(\d{4}\-\d{2}\-\d{2})/.test(value);
  },
  "Date is not valid.");

  $.validator.addMethod("mynumbers", function(value, element) 
  {
    return /^\d*\.?\d*$/.test(value);
  },
  "Please enter number, like this '1,0'.");

  $("#addForm").validate
  ({
    rules : 
    {
      "client[first_name]": {required: true},
      "client[last_name]": {required: true},
      "client[email]": {required: true, email: true},
      "manager[first_name]": {required: true},
      "manager[last_name]": {required: true},
      "manager[email]": {required: true, email: true},
      "programmer[first_name]": {required: true},
      "programmer[last_name]": {required: true},
      "programmer[email]": {required: true, email: true},
      "project[name]": {required: true},
      "project[date_of_start]": {required: true, deadline: true},
      "project[deadline]": {required: true, deadline: true},
      "project[totally]": {required: true, mynumbers: true},
      "project[paid]": {required: true, mynumbers: true},
    }
  });

  function update_validate()
  {
    $("#updateForm").validate
    ({
      rules : 
      {
        "client[first_name]": {required: true},
        "client[last_name]": {required: true},
        "client[email]": {required: true, email: true},
        "manager[first_name]": {required: true},
        "manager[last_name]": {required: true},
        "manager[email]": {required: true, email: true},
        "programmer[first_name]": {required: true},
        "programmer[last_name]": {required: true},
        "programmer[email]": {required: true, email: true},
        "project[name]": {required: true},
        "project[date_of_start]": {required: true, deadline: true},
        "project[deadline]": {required: true, deadline: true},
        "project[totally]": {required: true, mynumbers: true},
        "project[paid]": {required: true, mynumbers: true},
        "project[to_pay]": {required: true, mynumbers: true},
      }
    });
  }

  $(".delete-project").click(function()
  {
    if (confirm('Удалить проект?'))
    {
      var id_project = $(this).attr('id-project');
      // console.log(id_project)
      $.ajax
      ({
        type: 'POST',
        url: 'project/delete',
        data: {id_project: id_project}
      });
    }
  });

  $(".delete-client").click(function()
  {
    if (confirm('Удалить клиента?'))
    {
      var id_client = $(this).attr('id-client');
      $.ajax
      ({
        type: 'POST',
        url: 'delete',
        data: {id_client: id_client}
      });
    }
  });

  $(".delete-manager").click(function()
  {
    if (confirm('Удалить клиента?'))
    {
      var id_manager = $(this).attr('id-manager');
      $.ajax
      ({
        type: 'POST',
        url: 'delete',
        data: {id_manager: id_manager}
      });
    }
  });

  $(".delete-programmer").click(function()
  {
    if (confirm('Удалить клиента?'))
    {
      var id_programmer = $(this).attr('id-programmer');
      $.ajax
      ({
        type: 'POST',
        url: 'delete',
        data: {id_programmer: id_programmer}
      });
    }
  });

  datepick();
  update_validate();
});

function update() 
{
  var msg = $('form#updateForm').serialize();
  msg = JSON.stringify(msg);
  console.log(msg);
}


function add() 
{
  var msg = $('form#addForm').serialize();
  msg = JSON.stringify(msg);
  console.log(msg);
}

