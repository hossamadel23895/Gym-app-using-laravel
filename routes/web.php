<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\CityManagerController;
use App\Http\Controllers\GymManagerController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes(['register' => false]);

Route::get('home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::resource('city_managers', CityManagerController::class)->middleware('permission:CRUD_city_managers');

Route::resource('gym_managers', GymManagerController::class)->middleware('permission:CRUD_gym_managers');

