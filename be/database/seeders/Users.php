<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class Users extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \DB::table('users')->insert([
            'name' => 'Vui Từng Phút Giây',
            'email' => 'vuiqua@gmail.com',
            'password' => hash::make('hehe'),
            'address' => 'TPHCM'
        ]);
    }
}
