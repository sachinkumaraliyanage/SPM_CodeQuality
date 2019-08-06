<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 2019-08-05
  Time: 19.15SSSS
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/dataTables.bootstrap.min.css">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.buttons.min.js"></script>
    <script src="js/buttons.flash.min.js"></script>
    <script src="js/jszip.min.js"></script>
    <script src="js/pdfmake.min.js"></script>
    <script src="js/vfs_fonts.js"></script>
    <script src="js/buttons.html5.min.js"></script>
    <script src="js/buttons.print.min.js"></script>


  </head>
  <body>
  <h3>File Upload:</h3>
  Select a file to upload: <br />
<%--  <form  method = "post" enctype = "multipart/form-data" id="upload">--%>
<%--    <input type = "file" name = "file" size = "50" />--%>
<%--    <br />--%>
<%--    <input type = "button" value = "Upload File" onclick="loadetable()"/>--%>
<%--  </form>--%>

  <input type = "file" name = "file" size = "50" id="fileUploader"/>
  <br/><br>
  <div id="dis"></div>
    <table id="example" class="table table-striped table-bordered" style="width:100%">
      <thead>
        <tr>
          <td width="3%">Line no</td>
          <td width="46%">Program statements</td>
          <td width="30%">Tokens identified under the size factor</td>
          <td width="3%">Cs</td>
          <td width="3%">Ctc</td>
          <td width="3%">Cnc</td>
          <td width="3%">Ci</td>
          <td width="3%">TW</td>
          <td width="3%">Cps</td>
          <td width="3%">Cr</td>

        </tr>
      </thead>
      <tbody>

      </tbody>

    </table>
  <script>

    $('#fileUploader').on('change', uploadFile)

    function uploadFile(event)
    {
      event.stopPropagation();
      event.preventDefault();
      var files = event.target.files;
      var data = new FormData();
      $.each(files, function(key, value)
      {
        data.append(key, value);
      });
      loadetable(data);
    }

    $(document).ready(function() {
      $('#example').dataTable( {
        dom: 'Bfrtip',
        buttons: [
          'csv', 'excel', 'pdf', 'print'
        ],
        "paging": false,
        "searching": false,
        "ordering": false

      } );
    } );

    function loadetable(data) {


        $.ajax({
          url: 'ServletFileUploard',
          type: 'POST',
          data: data,
          cache: false,
          dataType: 'json',
          processData: false,
          contentType: false,
          success: function(data, textStatus, jqXHR)
          {
            console.log(data);

                    $("#example > tbody").html("");

                      for (var i=0;i<data.length;i++){
                        var tab='';
                        tab+="<tr>";
                          tab+="<td>";
                          tab+=i+1;
                          tab+="</td>"
                          tab+="<td>";
                            tab+=data[i].code;
                          tab+="</td>";
                          tab+="<td>";
                            tab+="tokens";
                          tab+="</td>";
                          tab+="<td>";
                            tab+="cs";
                          tab+="</td>";
                          tab+="<td>";
                            tab+="ctc";
                          tab+="</td>";
                          tab+="<td>";
                            tab+=data[i].nextcount;
                          tab+="</td>";
                          tab+="<td>";
                            tab+="ci";
                          tab+="</td>";
                          tab+="<td>";
                            tab+="tw";
                          tab+="</td>";
                          tab+="<td>";
                            tab+="cps";
                          tab+="</td>";
                          tab+="<td>";
                            tab+="cr";
                          tab+="</td>";
                        tab+="</tr>";
                        $('#example > tbody').append(tab);
                      }










          },
          error: function(jqXHR, textStatus, errorThrown)
          {
            console.log('ERRORS: ' + textStatus);
            console.log(errorThrown);
            console.log(jqXHR);
          }
        });




      //
      // $("#test").dataTable().fnDestroy();
      //
      // $('#test').DataTable({
      //   "processing": true,
      //
      //   // "serverSide": true,
      //   "ajax": {
      //     url: 'ServletFileUploard',
      //     type: 'POST',
      //     data:data,
      //     enctype: 'multipart/form-data',
      //     processData: false,  // Important!
      //     contentType: false,
      //     cache: false,
      //   },
      //   "columns": [
      //     {"data": "code"},
      //     {"data": "nextcount"}
      //
      //
      //   ],
      //   "pageLength": 25,
      //   dom: 'Bfrtip',
      //
      //   buttons: [
      //
      //     {
      //
      //       extend     : 'pdfHtml5',
      //
      //       orientation: 'landscape',
      //
      //       pageSize   : 'A4',
      //
      //
      //     },
      //
      //     'excelHtml5'
      //
      //
      //
      //   ]
      // });
    }


  </script>

  </body>
</html>
