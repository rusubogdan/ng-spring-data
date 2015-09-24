<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="lib/bootstrap-css-only/3.3.4/css/bootstrap.css" />
  </head>
  <body ng-app="myApp">
    <div class="container" ng-controller="AppController">
      <div class="page-header">
        <h1>A checklist</h1>
      </div>
      <div class="alert alert-info" role="alert" ng-hide="items && items.length > 0">
        There are no items yet.
      </div>
      <form class="form-horizontal" role="form" ng-submit="addItem(newItem)">
        <div class="form-group" ng-repeat="item in items">
          <div class="checkbox col-xs-9">
            <label>
              <input type="checkbox" ng-model="item.checked" ng-change="updateItem(item)"/> {{item.description}}
            </label>
          </div>
          <div class="col-xs-3">
            <button class="pull-right btn btn-danger" type="button" title="Delete"
              ng-click="deleteItem(item)">
              <span class="glyphicon glyphicon-trash"></span>
            </button>
          </div>
        </div>
        <hr />
        <div class="input-group">
          <input type="text" class="form-control" ng-model="newItem" placeholder="Enter the description..." />
          <span class="input-group-btn">
            <button class="btn btn-default" type="submit" ng-disabled="!newItem" title="Add">
              <span class="glyphicon glyphicon-plus"></span>
            </button>
          </span>
        </div>
      </form>
	</div>
    <script type="text/javascript" src="lib/angular/1.4.6/angular.js"></script>
    <script type="text/javascript" src="lib/angular-resource/1.4.6/angular-resource.js"></script>
    <script type="text/javascript" src="lib/angular-spring-data-rest/0.4.2/dist/angular-spring-data-rest.js"></script>
    <script type="text/javascript" src="lib/lodash/3.10.1/lodash.js"></script>
    <script type="text/javascript" src="app/app.js"></script>
    <script type="text/javascript" src="app/controllers.js"></script>
    <script type="text/javascript" src="app/services.js"></script>
  </body>
</html>