<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;

class CreateAdminCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:admin {--email=} {--password=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Creates a new admin user.';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle() {
        $admin = User::create([
            'name' => $this->option('email'),
            'email' => $this->option('email'),
            'email_verified_at' => now(),
            'password' => bcrypt($this->option('password')),
            'national_id' => '12345677654321',
            'avatar_url' => 'public/default_avatar.png',
            'date_of_birth' => '1999-9-13 00:00:0000'
        ]);

        $admin->assignRole('admin');

        $this->info("Admin created successfully");

        return 0;
    }
}
