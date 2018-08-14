<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>My Webshop</title>
  <meta name="author" content="">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="/static/bootstrap.min.css">
  <link rel="stylesheet" href="/static/style.css">
  <script src="/static/jquery.min.js"></script>
  <script src="/static/bootstrap.min.js"></script>
  
</head>

<body>
    <div class="container">
        <h1>My Webshop</h1>
        <h1>{{host_ip}}</h1>
        % if flag==1:
            <p>
                <div class="input-group input-group-lg">
                    <input type="text" class="form-control" placeholder="Search product" id="myInput">
                </div>
            </p>
            <br>
        % end
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody id="myTable">
                <tr>
                    <td>Sample product</td>
                    <td>Sample price</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            var split = value.split(" ")
            
            if(split.length > 1) {
                $("#myTable tr").filter(function() {                    
                    $(this).toggle($(this).text().toLowerCase().indexOf(split[0]) > -1 && $(this).text().toLowerCase().indexOf(split[1]) > -1 && $(this).text().toLowerCase().indexOf(split[2]) > -1)
                });
            } else {
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    
                });
            }
        });

    });

        
    </script>
</body>

</html>