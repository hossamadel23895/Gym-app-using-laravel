<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:55',
            'email' => 'email|required|unique:users',
            'password' => 'required',
            'gender'=>'required',
            'password_confirmation'=>'required',
            'date_of_birth'=>'required',
            'profile_image'=>'nullable|image|mimes:jpg,bmp,png'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $user = User::create($validatedData);

        event(new Registered($user));

        $accessToken = $user->createToken('MyApp')->plainTextToken;

        return response(['user' => $user, 'access_token' => $accessToken]);
    }

    public function login(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')->plainTextToken;
            $success['name'] =  $user->name;
            $user->last_login = date('Y-m-d H:i:s');
            $user->save();

            //  return $this->sendResponse($success, 'User login successfully.');
            return response(['user' => $user, 'access_token' => $success['token']]);
        } else {
            return response(['message' => 'Invalid Credentials']);
        }
    }
}
