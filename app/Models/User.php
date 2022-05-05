<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable , HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'name',
        'email',
        'password',
        'national_id',
        'avatar_url',
        'manageable_id',
        'manageable_type',
        'gender',
        'date_of_birth',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'date_of_birth' => 'date:d/m/Y',
    ];


    public function manageable()
    {
        return $this->morphTo();
    }

    public function sessions()
    {
        return $this->belongsToMany(Session::class);
    }

    public function buys()
    {
        return $this->morphMany('App\Purchase', 'buyable');
    }

    public function sells()
    {
        return $this->morphMany('App\Purchase', 'sellable');
    }
    public function member()
    {
        return $this->belongsTo(Attendance::class, 'member_id', 'id');
    }
    public function routeNotificationForMail($notification)
    {
        // Return email address only...
        return $this->email;

        // Return email address and name...
        return [$this->email => $this->name];
    }
}
