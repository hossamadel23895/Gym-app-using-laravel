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

</li>
