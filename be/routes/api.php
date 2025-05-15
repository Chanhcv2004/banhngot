<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\CategoryController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/login', [LoginController::class, 'index']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/register', [AuthController::class, 'createUser']);

Route::get('/product', [ProductController::class, 'getAll']);
Route::get('/product/{id}', [ProductController::class, 'getById']);
Route::get('/relatedproduct/{id}', [ProductController::class, 'getRelatedById']);

Route::get('/comment', [CommentController::class, 'getAll']);
Route::post('/sendcomment/{product}/{user}', [CommentController::class, 'sendComment']);

Route::get('/getCartByUser/{user_code}', [OrderController::class, 'getCartByUser']);
Route::post('/addCartByUser/{user_code}', [OrderController::class, 'addCartByUser']);
Route::post('/addproducttocart', [OrderController::class, 'addProductToCart']);
Route::get('/getorderdetail/{order_code}', [OrderController::class, 'getOrderDetail']);
Route::put('/updateproductincart', [OrderController::class, 'updateProductInCart']);
Route::get('/getdatatocart/{user_code}', [OrderController::class, 'getDataToCart']);
Route::delete('/deleteproductcart/{order_code}/{product_code}', [OrderController::class, 'deleteProductCart']);
Route::put('/updateorder/{order_code}', [OrderController::class, 'updateOrder']);

Route::get('/getdatahisory/{user_code}', [OrderController::class, 'getDataHistory']);
Route::put('/updateuser/{user_code}', [UserController::class, 'updateUser']);

Route::get('/getcarttoadmin', [OrderController::class, 'getCartToAdmin']);
Route::put('/updatestatus/{order_code}/{user_code}', [OrderController::class, 'updateStatus']);
Route::put('/adminchangestatus/{order_code}', [OrderController::class, 'adminChangeStatus']);

Route::get('/getallcategories', [CategoryController::class, 'getAllCategory']);
Route::post('/addcategory', [CategoryController::class, 'addCategory']);
Route::delete('/deletecategory/{id}', [CategoryController::class, 'deleteCategory']);

Route::put('/adddiscounttocart/{user_id}', [OrderController::class], 'addDiscountToCart');

Route::post('/addpay', [OrderController::class, 'addPay']);
Route::get('/getcategory/{category_id}', [CategoryController::class, 'getCategoryById']);
Route::put('/updatecategory/{category_id}', [CategoryController::class, 'updateCategory']);



