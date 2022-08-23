pragma solidity ^0.5.0; 
contract Todolist{
    uint public taskCount=0; 
    struct Task{
        uint id; 
        string task;
        bool completed;
    }
    mapping(uint=>Task) public tasks;
    constructor() public{
        addTask("Helooo");
    }
    event TaskCreated(
        uint id,
        string task, 
        bool completed
    );
    function addTask(string memory _task) public{
        taskCount+=1; 
        tasks[taskCount]=Task(taskCount,_task,false);
        emit TaskCreated(taskCount,_task,false);
    }
    function getTaskCount() public view returns(uint){
        return taskCount;
    } 
    function taskList(uint id) public view returns(uint,string memory,bool){ 
        return (id,tasks[id].task,false);
    }
}