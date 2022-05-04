<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CityManagerController;
use App\Http\Controllers\GymManagerController;
use App\Http\Controllers\GymController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PurchaseController;

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

Auth::routes(['register' => false]);

Route::get('/', function () {
    return redirect()->route('home');
});

Route::get('home', [HomeController::class, 'index'])->name('home');

Route::resource('city_managers', CityManagerController::class)->middleware('permission:CRUD_city_managers');

Route::resource('gym_managers', GymManagerController::class)->middleware('permission:CRUD_gym_managers');

Route::resource('gyms', GymController::class)->middleware('permission:CRUD_gyms');

Route::resource('sessions', SessionController::class)->middleware('permission:CRUD_sessions');

Route::get('attendance', [AttendanceController::class, 'index'])->name('attendance.index')->middleware('permission:Read_attendance');

Route::resource('packages', PackageController::class)->middleware('permission:CRUD_packages|Read_packages');

Route::resource('purchases', PurchaseController::class)->middleware('permission:Read_purchases');
