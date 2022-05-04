<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gym extends Model {
    use HasFactory;

    protected $fillable = [
        'name',
        'cover_url',
        'starts_at',
        'finishes_at',
    ];

    public function users() {
        return $this->morphMany('App\User', 'manageable');
    }

    public function sessions() {
        return $this->morphMany('App\Session', 'has_sessions');
    }

    public function packages() {
        return $this->morphMany('App\Package', 'has_packages');
    }
}
