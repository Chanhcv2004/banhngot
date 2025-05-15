<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pay extends Model
{
    protected $fillable = ['order_code', 'name_user', 'address', 'phone', 'payment_method', 'total_amount', 'created_at'];
}
