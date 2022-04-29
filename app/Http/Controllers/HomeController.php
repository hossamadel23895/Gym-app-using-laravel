<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class HomeController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index() {
        // First time only configurations.
            // Creating Roles
            // $admin = Role::create(['name' => 'admin']);
            // $city_manager = Role::create(['name' => 'city_manager']);
            // $gym_manager = Role::create(['name' => 'gym_manager']);

            // Creating permissions.
            // $CRUD_city_managers = Permission::create(['name' => 'CRUD_city_managers']);
            // $CRUD_gym_managers = Permission::create(['name' => 'CRUD_gym_managers']);

            // Assigning permissions to roles.
            // $admin->givePermissionTo([$CRUD_city_managers, $CRUD_gym_managers]);
            // $city_manager->givePermissionTo($CRUD_gym_managers);

            // Assigning Admin his role
            // auth()->user()->assignRole('admin');

        return view('home', []);
    }
}
