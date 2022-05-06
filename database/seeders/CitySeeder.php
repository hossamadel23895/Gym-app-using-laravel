<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use App\Models\City;

class CitySeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        for ($i = 0; $i < 5; $i++) {
            $city = City::create([
                'name' => Str::random(10),
            ]);
        }
    }
}
