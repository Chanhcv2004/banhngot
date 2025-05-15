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
            Schema::create('orders', function (Blueprint $table) {
                $table->id();
                $table->timestamps();
                $table->integer('quantity')->default(0);
                $table->decimal('total', 10, 0)->default(0);
                $table->enum('status', ['Giỏ hàng','Chờ xác nhận', 'Đang giao', 'Giao hàng thành công', 'Hủy đơn hàng'])->default('Giỏ hàng');
                $table->string('discount_code', 50)->nullable();
                $table->foreign('discount_code')->references('code')->on('discounts');
                $table->unsignedBigInteger('user_code');
                $table->foreign('user_code')->references('id')->on('users');
            });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
