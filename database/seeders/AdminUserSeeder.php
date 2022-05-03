<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class AdminUserSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $admin = User::create([
            'name' => 'admin',
            'email' => 'admin@admin.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'national_id' => '12345677654321',
            'avatar_url' => 'public/default_avatar.png',
            'manageable_id' => function() {
                return factory(App\User::class)->create()->id;
            },
        ]);

        $admin->assignRole('admin');
    }
}
