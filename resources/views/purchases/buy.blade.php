
@extends('layouts.app')


@section('content')
<form action="{{ route('purchases.store') }}" method="POST">
        {{ csrf_field() }}
        {{ method_field('POST') }}
    <div class="form-group row">
        <label for="package" class="col-sm-4 col-form-label">Training Package</label>
        <div class="col-sm-8">
            <select class="form-control select2" style="width: 100%;" id="package" name="package">
                @foreach($packages as $package)
                    <option value="{{$package->id}}">{{$package->name}} - {{number_format($package->price / 100, 2, ',', '.')}}$</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="user" class="col-sm-4 col-form-label">User</label>
        <div class="col-sm-8">
            <select class="form-control select2" style="width: 100%;" id="user" name="user">
                @foreach($users as $user)
                    <option value="{{$user->id}}">{{$user->name}}</option>
                @endforeach
            </select>
              </div>
                </div>
            <div class="form-group row">
                <label for="gym" class="col-sm-4 col-form-label">GYM</label>
                <div class="col-sm-8">
                    <select class="form-control select2" style="width: 100%;" id="gym" name="gym">

                            <option value="{{$gyms->id}}">{{$gyms->name}}</option>

                    </select>
                <br>
                <Button class="btn btn-success" type="submit">Submit</Button>
            </div>
        </div>

</form>

@endsection
{{-- @extends('layouts.app')

@section('content')
<form action="{{ route('purchases.store') }}" method="POST">
    <div class="form-group row">
        <label for="package" class="col-sm-4 col-form-label">Training Package</label>
        <div class="col-sm-8">
            <select class="form-control select2" style="width: 100%;" id="package" name="package">
                @foreach($packages as $package)
                    <option value="{{$package->id}}">{{$package->name}} - {{number_format($package->price / 100, 2, ',', '.')}}$</option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="user" class="col-sm-4 col-form-label">User</label>
        <div class="col-sm-8">
            <select class="form-control select2" style="width: 100%;" id="user" name="user">
                @foreach($users as $user)
                    <option value="{{$user->id}}">{{$user->name}}</option>
                @endforeach
            </select>
        </div>
    </div>
    @hasanyrole('city_manager|admin')
    <div class="form-group row">
        <label for="gym" class="col-sm-4 col-form-label">GYM</label>
        <div class="col-sm-8">
            <select class="form-control select2" style="width: 100%;" id="gym" name="gym">
                @foreach($gyms as $gym)
                    <option value="{{$gym->id}}">{{$gym->name}}</option>
                @endforeach
            </select>
        <br>
        <Button class="btn btn-success" type="submit">Submit</Button>
    </div>
</div>
    @endrole
</form>
@endsection --}}


