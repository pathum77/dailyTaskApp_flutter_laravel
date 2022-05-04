<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class ListController extends Controller
{
    public function getData(){
        return Task::all();
    }

    public function addTask(Request $request){
        $data = new Task;

        $data->taskname=$request->taskname;
        $data->description=$request->description;
        $data->startdate=$request->startdate;
        $data->enddate=$request->enddate;

        return $data->save();
    }

    public function editTask(Request $request, $id){
        $data = Task::find($id);

        $data->taskname=$request->taskname;
        $data->description=$request->description;
        $data->startdate=$request->startdate;
        $data->enddate=$request->enddate;

        return $data->update();
    }

    public function deleteTask($id){
        $data = Task::find($id);

        return $data -> delete();
    }
}
