<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pays', function (Blueprint $table) {
            $table->unsignedBigInteger('order_code')->primary();
            $table->string('name_user', 50);
            $table->string('address', 255);
            $table->string('phone', 10);
            $table->enum('payment_method', ['Thẻ Tín Dụng', 'Paypal', 'Thanh Toán Khi Nhận Hàng']);
            $table->decimal('total_amount', 10, 0)->default(0);
            $table->foreign('order_code')->references('id')->on('orders');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pays');
    }
};
