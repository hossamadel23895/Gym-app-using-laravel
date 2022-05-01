<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\RedirectResponse;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Hash;
use Illuminate\Support\Facades\File;

class ProfileController extends Controller
{
    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|min:2|max:55',
            'email' => 'email|required|unique:users',
            'password' => 'required|min:6|max:100',
            'gender'=>'required',
            'password_confirmation'=>'required',
            'date_of_birth'=>'required',
            'profile_image'=>'nullable|image|mimes:jpg,bmp,png'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message'=>'Validations fails',
                'errors'=>$validator->errors()
            ], 422);
        }

        $user=$request->user();

        if ($request->hasFile('profile_image')) {
            if ($user->profile_image) {
                $old_path=public_path().'/uploads/profile_images/'.$user->profile_image;
                if (File::exists($old_path)) {
                    File::delete($old_path);
                }
            }

            $image_name='profile_image-'.time().'.'.$request->profile_image->extension();
            $request->profile_image->move(public_path('/uploads/profile_images'), $image_name);
        } else {
            $image_name=$user->profile_image;
        }


        $user->update([
            'name' => $request->name,
            'email' =>  $request->email,
            'password' => bcrypt($request->password),
            'gender'=> $request->gender,
            'password_confirmation'=> bcrypt($request->password_confirmation),
            'date_of_birth'=>$request->date_of_birth,
            'profile_image'=>$image_name
        ]);

        return response()->json([
            'message'=>'Profile successfully updated',
        ], 200);
    }
}
