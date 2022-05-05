<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Session;
use App\Models\City;
use Illuminate\Support\Facades\File;
use Spatie\Permission\Models\Role;
use \App\Http\Requests\StoreSessionRequest;
use App\Models\Attendance;
use yajra\Datatables\Datatables;
use App\Models\session_user;

class SessionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $sessions = Session::query();
            return Datatables::of($sessions)
                ->make(true);
        } else {
            $coaches = Role::where("name", "coach")->first()->users;
            return view('sessions.index', [
                'coaches' => $coaches,
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSessionRequest $request)
    {
        $session = Session::Create(
            [
                'name' => $request->name,
            ],
        );
        return response()->json(['success' => 'Session saved successfully.']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreSessionRequest $request, $session_id)
    {
        $session = Session::find($session_id);

        $session->update([
            'name' => $request->name,
        ]);

        return response()->json(['success' => 'Session updated successfully.']);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($session_id)
    {
        $session = Session::find($session_id);
        $session->delete();
        return response()->json(['success' => 'Session deleted successfully.']);
    }
    public function calculate_remaining(Request $request, $user_id)
    {
        $TotalSessions = session_user::where('user_id', $user_id)->count();
        $attendedSessions = Attendance::where('member_id', $user_id)->count();
        $remainingSessions = $TotalSessions -$attendedSessions;
        return response()->json(['remainingSessions' => $remainingSessions]);
    }
}
