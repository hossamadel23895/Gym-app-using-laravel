<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use App\Models\User;

class UserSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        for ($i = 0; $i < 50; $i++) {
            $user = User::create([
                'name' => Str::random(10),
                'email' => Str::random(10) . '@gmail.com',
                'password' => Hash::make('123456'),
                'email_verified_at' => now(),
                'national_id' => rand(10000000000000, 99999999999999),
                'avatar_url' => 'public/default_avatar.png',
            ]);

            // attach random role to user, the can be duplicated
            $user->roles()->attach(rand(8, 9));
        }
    }
}
