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
        return $this->morphMany(User::class, 'manageable');
    }

    public function has_gyms(){
        return $this->morphTo();
    }

    public function sessions() {
        return $this->morphMany(Session::class, 'has_sessions');
    }

    public function packages() {
        return $this->morphMany(Package::class, 'has_packages');
    }

    public function purchases() {
        return $this->morphMany(Purchase::class, 'has_purchases');
    }
}
