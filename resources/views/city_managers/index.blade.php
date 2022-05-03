@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <h1 class="text-black-50 text-center"> City Managers </h1>
    </div>
    <div class="d-flex justify-content-end mb-3">
        <a class="btn btn-success" href="javascript:void(0)" id="createNewUser"> Add New User</a>
    </div>
    <table id="cityManagersTable" class="table table-bordered mt-4">
        <thead>
            <tr>
                <th scope="col">Avatar</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">National ID</th>
                <th scope="col">City</th>
                <th scope="col" style="width: 200px">Actions</th>
            </tr>
        </thead>
    </table>

    <!-- Create and update Hidden div -->
    <div class="modal fade" id="ajaxModel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modelHeading"></h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="userForm" name="userForm" class="form-horizontal" enctype="multipart/form-data">
                        {{-- @csrf --}}
                        {{-- @method('PUT') --}}
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                                    value="" maxlength="50" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email"
                                    required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-12">
                                <input type="password" class="form-control" id="password" name="password" value=""
                                    required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">National ID</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="national_id" name="national_id"
                                    placeholder="Enter National ID number" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="col-sm-12 control-label">Select City</label>
                            <select id="citySelect" class="col-sm-12">
                                @foreach ($cities as $city)
                                    <option value="{{ $city->id }}">{{ $city->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group d-flex flex-column">
                            <label for="name" class="col-sm-12 control-label">Upload Avatar photo (optional)</label>
                            <input type="file" name="user_img" class="mb-3 mx-2" id="user_img">
                        </div>
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary" id="saveBtn" value="create">Save changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete confiramtion box div -->
    <div class="modal fade" id="deleteModel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="deleteHeading"></h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="deleteForm" name="deleteForm" class="form-horizontal">
                        @csrf
                        @method('DELETE')
                        <div>Are you sure you want to delete this User?</div>
                        <div>This action cannot be undone.</div>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-danger mx-1" id="deleteBtn" value="delete">Confirm Delete
                            </button>
                            <button type="button" class="btn btn-secondary mx-1" id="deleteCancelBtn" value="cancel">Cancel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        var user_id = "";

        $(document).ready(function() {
            $.noConflict();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $('#cityManagersTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('city_managers.index') }}',
                columns: [{
                        data: 'avatar',
                        name: 'avatar',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'email',
                        name: 'email'
                    },
                    {
                        data: 'national_id',
                        name: 'national_id'
                    },
                    {
                        data: 'city',
                        name: 'city'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                ]
            });

            // Create button action.
            $('#createNewUser').click(function() {
                $('#saveBtn').val("create-user");
                $('#userForm').trigger("reset");
                $('#modelHeading').html("Add New User");
                $('#ajaxModel').modal('show');
            });

            // Edit user button action.
            $('body').on('click', '.editUser', function() {
                user_id = $(this).data('id');
                var name = $(this).parent().siblings()[1].innerHTML;
                var email = $(this).parent().siblings()[2].innerHTML;
                var national_id = $(this).parent().siblings()[3].innerHTML;
                $.get("{{ route('city_managers.index') }}" + '/' + user_id + '/edit', function(data) {
                    $('#modelHeading').html("Edit User");
                    $('#saveBtn').val("edit-user");
                    $('#ajaxModel').modal('show');
                    $('#name').val(name);
                    $('#email').val(email);
                    $('#national_id').val(national_id);
                })
            });

            // Handling both Create and edit ajax requests.
            $('#saveBtn').click(function(e) {
                e.preventDefault();
                $(this).html('Sending..');
                var request_is_create = $('#modelHeading').html() == "Add New User";
                var url = request_is_create ? "/city_managers" : "/city_managers/" + user_id;
                var method = request_is_create ? "POST" : "PUT";
                var myFormData = new FormData();
                myFormData.append('_method', method);
                myFormData.append('user_id', user_id);
                myFormData.append('name', $('#name').val());
                myFormData.append('email', $('#email').val());
                myFormData.append('password', $('#password').val());
                myFormData.append('national_id', $('#national_id').val());
                myFormData.append('manageable_id', $('#citySelect').find(":selected").val());
                myFormData.append('user_img', $('#user_img')[0].files[0]);

                $.ajax({
                    url: url,
                    type: "POST",
                    // dataType: 'json',
                    processData: false,
                    contentType: false,
                    cache: false,
                    // enctype: 'multipart/form-data',
                    data: myFormData,
                    success: function(data) {
                        $('#userForm').trigger("reset");
                        $('#ajaxModel').modal('hide');
                        $('#cityManagersTable').DataTable().ajax.reload();
                    },
                    error: function(error) {
                        console.log('Error:', error);
                    }
                });
                $('#saveBtn').html('Save Changes');
            });


            // Delete button action.
            $('body').on('click', '.deleteUser', function() {
                user_id = $(this).data('id');
                $('#deleteBtn').val("Delete");
                $('#deleteForm').trigger("reset");
                $('#deleteHeading').html("Delete confirmation");
                $('#deleteModel').modal('show');
            });

            // Handling delete ajax request.
            $('#deleteBtn').click(function(e) {
                e.preventDefault();
                $(this).html('Deleting..');
                var url = "/city_managers/" + user_id;
                $.ajax({
                    url: url,
                    data: {
                        "_token": "{{ csrf_token() }}",
                        "user_id": user_id,
                    },
                    type: "DELETE",
                    dataType: 'json',
                    success: function(data) {
                        $('#cityManagersTable').DataTable().ajax.reload();
                        $('#deleteModel').modal('hide');
                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });
                $('#deleteBtn').html('Confirm Delete');
            });

            $('#deleteCancelBtn').click(function(e) {
                $('#deleteModel').modal('hide');
            });
        });
    </script>

    <script>
        // Updating confirmation box delete button uri with the id of the clicked post.
        const updateConfirmUri = (e) => document.getElementById("delete_form").action = e.getAttribute("href");
    </script>
@endsection
