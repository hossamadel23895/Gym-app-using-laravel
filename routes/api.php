<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\EmailVerificationController;
use App\Http\Controllers\Api\NewPasswordController;
use App\Http\Controllers\Api\VerificationController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\PurchaseController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});





/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


Route::post('/password/email', [ForgotPasswordController::class, 'sendResetLinkEmail']);
Route::get('/password/reset', [ResetPasswordController::class, 'reset']);

Route::get('/email/resend', [VerificationController::class, 'resend'])->name('verification.resend');
Route::get('/email/verify/{id}', [VerificationController::class, 'verify'])->name('verification.verify');

Route::post('/profile/update-profile', [ProfileController::class, 'update_profile'])->name('update.profile')->middleware('auth:sanctum');
Route::get('/remainingSession/{user_id}', [SessionController::class, 'calculate_remaining'])->name('session.remaining');
Route::get('/attendance-history/{user_id}', [SessionController::class, 'calculate_attendance'])->name('session.attendance')->middleware('auth:sanctum');
Route::post('/training-sessions/{id}', [SessionController::class, 'attend_session']);
