<?php

namespace App\Http\Controllers;

use App\DataTables\PurchasesDataTable;
use App\Http\Resources\PurchaseResource;
use App\Models\Gym;
use App\Models\Purchase;
use App\Http\Requests\UpdatePurchaseRequest;
use App\Models\TrainingPackage;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\URL;
use Yajra\DataTables\Facades\DataTables;
use Spatie\Permission\Models\Role;
use \App\Http\Requests\StoreUserRequest;
use Stripe;

use App\Models\Package;

class PurchaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('purchases.index');
    }
    public function create(Request $request, Response $response)
    {
        $packages = Package::select('id', 'name', 'price')->orderBy('name')->get();
        $users = User::role('member')->select('id', 'name')->orderBy('name')->get();
        $gyms = Auth::user()->manageable;
        // dd(Auth::user());

        return view('purchases.buy', compact('packages', 'users', 'gyms'));
    }
    public function store(Request $request)
    {
        // dd('yarb');
        $package_id = $request->package;
        $user_name = User::find($request->user)->name;
        $package = Package::find($request->package);
        //  $manager = User::select('id', 'name', 'manageable_id')->where('manageable_type', '\App\Models\City')->orderBy('name')->get();
        $gym_id= Auth::user()->manageable->id;
        Purchase::create([
            'name' => $user_name,
            'price' => $package->price *100,
            'sessions_amount' => $package->sessions_amount,
            'buyable_type'=>'\App\Models\Package',
            'buyable_id'=>$package_id,
            'sellable_type'=>Auth::user()->manageable_type,
            'sellable_id'=>Auth::user()->id,
            'gym_id'=>$gym_id,
  ]);
        \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $session = \Stripe\Checkout\Session::create([
            'line_items' => [[
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => $package->name . ' Training Package',
                    ],
                    'unit_amount' => (integer)$package->price,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => URL::to('/purchases/finish/success'),
            'cancel_url' => URL::to('/purchases/finish/cancel'),
        ]);
        return redirect($session->url, 303);
    }
    public function pay($status)
    {
        $purchase_id = DB::table("purchases")->where('is_paid', 0)->where('sellable_id', Auth::user()->id)->max('id');
        if ($purchase_id) {
            $purchase = DB::table("purchases")->where('id', $purchase_id);
            if ($status == 'success') {
                $purchase->update(['is_paid' => true]);
                Session::flash('message', 'Payment Finished Successfully');
                Session::flash('alert-class', 'alert-success');
                return redirect()->route('purchases.create');
            } else {
                $purchase->delete();
            }
        }

        Session::flash('message', 'Payment Canceled!');
        Session::flash('alert-class', 'alert-danger');
        return redirect()->route('purchases.create');
    }
    public function test(Request $request)
    {
        $members = User::role('gym_manager')->get();


        // if (Auth::user()->hasRole('city_manager')) {
        //     $gyms = Auth::user()->cities->gyms;
        // } elseif (Auth::user()->hasRole('gym_manager')) {
        //     $gyms = Auth::user()->gym;
        // } else {
        //     $gyms = Gym::select('id', 'name')->orderBy('name')->get();
        // }

        //  $members = User::role('member')->select('id', 'name')->orderBy('name')->get();
        $user_name = User::find(2)->name;
        $gyms = Auth::user()->manageable;
        return   $gyms;
    }
}
