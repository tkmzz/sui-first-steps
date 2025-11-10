module todolist::todolist{
    use std::string::String;

    public struct TodoList has key, store {
        id: UID,
        tasks: vector<String>
    }

    public fun new(ctx: &mut TxContext){
        let list = TodoList {
            id: object::new(ctx),
            tasks: vector[],
        };
        
        transfer::transfer(list, tx_context::sender(ctx));
    }

    public fun addItem(list: &mut TodoList, item: String){
        list.tasks.push_back(item);
    }

    public fun removeItem(list: &mut TodoList, index: u64){
        list.tasks.remove(index);
    }

    public fun deleteList(list: TodoList){
        let TodoList {id, tasks: _} = list;
        id.delete()
    }

}


