<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ListController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getlist', [ListController::class, 'getData']);
Route::post('/addtask', [ListController::class, 'addTask']);
Route::put('edittask/{id}', [ListController::class, 'editTask']);
Route::delete('deletetask/{id}', [ListController::class, 'deleteTask']);
