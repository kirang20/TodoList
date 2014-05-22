#import "K3TodoListController.h"
#import "K3TodoItem.h"
#import "K3AddToDoItemViewController.h"

@interface K3TodoListController ()

@end

@implementation K3TodoListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData
{
    K3TodoItem *item1 = [[K3TodoItem alloc] initWithName:@"Water the plants"];
    [self.todoItems addObject:item1];
    K3TodoItem *item2 = [[K3TodoItem alloc] initWithName:@"Cut nails"];
    [self.todoItems addObject:item2];
    K3TodoItem *item3 = [[K3TodoItem alloc] initWithName:@"Buy flip-flops"];
    [self.todoItems addObject:item3];
    K3TodoItem *item4 = [[K3TodoItem alloc] initWithName:@"Buy pressure cooker"];
    [self.todoItems addObject:item4];
    K3TodoItem *item5 = [[K3TodoItem alloc] initWithName:@"Pack bag for London Trip!"];
    [self.todoItems addObject:item5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todoItems count];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    K3AddToDoItemViewController *source = [segue sourceViewController];
    if(source.toDoItem != Nil)
    {
        [self.todoItems addObject:source.toDoItem];
        [self.tableView reloadData];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    K3TodoItem *todo = [self.todoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = todo.name;
    if(todo.completed)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    K3TodoItem *tappedTodo = [self.todoItems objectAtIndex:indexPath.row];
    tappedTodo.completed = !tappedTodo.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationNone];;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
