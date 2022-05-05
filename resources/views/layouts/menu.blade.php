<!-- need to remove -->
<li class="nav-item">

    <a href="{{ route('home') }}" class="nav-link {{ Request::is('home') ? 'active' : '' }}">
        <i class="nav-icon fas fa-home"></i>
        <p>Home</p>
    </a>

    @can('CRUD_city_managers')
        <a href="{{ route('city_managers.index') }}" class="nav-link {{ Request::is('city_managers') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>City Managers</p>
        </a>
    @endcan

    @can('CRUD_gym_managers')
        <a href="{{ route('gym_managers.index') }}" class="nav-link {{ Request::is('gym_managers') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Gym Managers</p>
        </a>
    @endcan

    @can('CRUD_gyms')
        <a href="{{ route('gyms.index') }}" class="nav-link {{ Request::is('gyms') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Gyms</p>
        </a>
    @endcan

    @can('CRUD_sessions')
        <a href="{{ route('sessions.index') }}" class="nav-link {{ Request::is('sessions') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Sessions</p>
        </a>
    @endcan

    @can('Read_attendance')
        <a href="{{ route('attendance.index') }}" class="nav-link {{ Request::is('attendance') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Attendance</p>
        </a>
    @endcan

    @if(auth()->user()->hasAnyPermission(['CRUD_packages', 'Read_packages']))
    <a href="{{ route('packages.index') }}" class="nav-link {{ Request::is('packages') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Packages</p>
        </a>
    @endif

    @can('Read_purchases')
        <a href="{{ route('purchases.index') }}" class="nav-link {{ Request::is('purchases') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Purchases</p>
        </a>
    @endcan
    @can('CRUD_purchases')
        <a href="{{ route('purchases.create') }}" class="nav-link {{ Request::is('purchases') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>
            <p>Buy package for user</p>
        </a>
    @endcan

    {{-- @if(auth()->user()->hasAnyPermission(['CRUD_purchases']))
    <a href="{{ route('purchases.create') }}" class="nav-link {{ Request::is('purchases') ? 'active' : '' }}">
            <i class="nav-icon fas fa-dashboard"></i>

            <p>Buy package for user</p>
        </a>
    @endif --}}
    <a href="{{ route('purchases.create') }}" class="nav-link {{ Request::is('purchases') ? 'active' : '' }}">
        <i class="nav-icon fas fa-dashboard"></i>

        <p>Buy package for user</p>
    </a>

</li>
