<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class Categories extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \DB::table('categories')->insert([
            'name' => 'Bánh Ngọt',
        ]);
        \DB::table('categories')->insert([
            'name' => 'Cookie',
        ]);
        \DB::table('categories')->insert([
            'name' => 'Bánh Mì Ngọt',
        ]);
        \DB::table('categories')->insert([
            'name' => 'Quag Tặng',
        ]);
        \DB::table('categories')->insert([
            'name' => 'Đồ Uống',
        ]);
        \DB::table('categories')->insert([
            'name' => 'Bánh Quy',
        ]);
    }
}
