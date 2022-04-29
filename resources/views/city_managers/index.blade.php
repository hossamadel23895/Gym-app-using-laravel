@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <h1 class="text-black-50 text-center"> City Managers </h1>
    </div>

    <table id="cityManagersTable" class="table mt-4">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Slug</th>
                <th scope="col">Posted By</th>
                <th scope="col">Created At</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td>Title1</td>
                <td>Slug1</td>
                <td>Posted By1</td>
                <td>Created At1</td>
                <td>
                    <a href="#" class="btn btn-primary">View</a>
                    <a href="#" class="btn btn-warning">Edit</a>
                    <a href="#" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>Title2</td>
                <td>Slug2</td>
                <td>Posted By2</td>
                <td>Created At2</td>
                <td>
                    <a href="#" class="btn btn-primary">View</a>
                    <a href="#" class="btn btn-warning">Edit</a>
                    <a href="#" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </tbody>
    </table>
    <script>
        jQuery(document).ready(function($) {
            $.noConflict();
            var table = $('#cityManagersTable').DataTable();
        });
    </script>
@endsection
