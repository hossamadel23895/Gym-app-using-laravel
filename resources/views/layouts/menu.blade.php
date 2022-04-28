<!-- need to remove -->
<li class="nav-item">
    <a href="{{ route('home') }}" class="nav-link {{ Request::is('home') ? 'active' : '' }}">
        <i class="nav-icon fas fa-home"></i>
        <p>Home</p>
    </a>
    <a href="/dashboard" class="nav-link {{ Request::is('dashboard') ? 'active' : '' }}">
        <i class="nav-icon fas fa-dashboard"></i>
        <p>Coaches</p>
    </a>
</li>