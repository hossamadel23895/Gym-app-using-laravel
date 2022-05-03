<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class RolesAndPermissionsSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        // Creating Roles
        $admin = Role::create(['name' => 'admin']);
        $city_manager = Role::create(['name' => 'city_manager']);
        $gym_manager = Role::create(['name' => 'gym_manager']);

        // Creating permissions.
        $CRUD_city_managers = Permission::create(['name' => 'CRUD_city_managers']);
        $CRUD_gym_managers = Permission::create(['name' => 'CRUD_gym_managers']);

        // Assigning permissions to roles.
        $admin->givePermissionTo([$CRUD_city_managers, $CRUD_gym_managers]);
        $city_manager->givePermissionTo($CRUD_gym_managers);  
    }
}
