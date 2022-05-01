<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function update_profile(Request $request, User $user)
    {
        $validator = Validator::make($request->all(), [

            'name' => 'min:2|max:55',
            'email' => 'unique:users,email,'.$user->id,
            'profile_image'=>'nullable|image|mimes:jpg,bmp,png'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'message'=>'Validations fails',
                'errors'=>$validator->errors()
            ], 422);
        }

        $user=$request->user();
        $allData=$request->all();
        if ($request->hasFile('profile_image')) {
            if ($user->profile_image) {
                $old_path=public_path().'/uploads/profile_images/'.$user->profile_image;
                if (File::exists($old_path)) {
                    File::delete($old_path);
                }
            }

            $image_name='profile_image-'.time().'.'.$request->profile_image->extension();
            $allData['profile_image']=$image_name;
            $request->profile_image->move(public_path('/uploads/profile_images'), $image_name);
        } else {
            $image_name=$user->profile_image;
            $allData['profile_image']=$image_name;
        }



        $user->update($allData);

        return response()->json([
            'message'=>'Profile successfully updated',
        ], 200);
    }
}
