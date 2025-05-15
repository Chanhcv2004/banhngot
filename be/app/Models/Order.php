<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['create_at', 'quantity', 'total', 'status', 'discount', 'user_code'];
}
