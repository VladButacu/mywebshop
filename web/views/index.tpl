<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>My webshop</title>
  <meta name="author" content="">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="/static/bootstrap.min.css">
  <script src="/static/jquery.min.js"></script>
  <script src="/static/bootstrap.min.js"></script>
</head>

<body>

    <div class="container">
        <h2>My webshop</h2>
        % if flag == 0:
            <input class="form-control" id="myInput" type="text" placeholder="Search..">
            <br>
        % end
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody id="myTable">
                <tr>
                    <td>Sample Product</td>
                    <td>Sample Price</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
    </script>
</body>

</html>