%% Programming Assignment: Logistic Regression with a Neural Network Mindset
% You will build a simple image-recognition algorithm that can correctly 
% classify pictures as cat or non-cat.
% Build the general architecture of a learning algorithm, including:
% Initializing parameters
% Calculating the cost function and its gradient
% Using an optimization algorithm (gradient descent)
% Gather all three functions above into a main model function, in the right order.
%% Loading the dataset
train_set_x_orig = permute(h5read('train_catvnoncat.h5','/train_set_x'),[3 2 1 4]);
train_set_y_orig = h5read('train_catvnoncat.h5','/train_set_y')';
test_set_x_orig = permute(h5read('test_catvnoncat.h5','/test_set_x'),[3 2 1 4]);
test_set_y_orig = h5read('test_catvnoncat.h5','/test_set_y')';
classes = h5read('test_catvnoncat.h5','/list_classes');

%% Example of a picture
Index = 26;
Image = imshow(train_set_x_orig(:,:,:,Index),[0,255]);
y = train_set_y_orig(1,Index);
%% Flatten the x matrices
size_train = size(train_set_x_orig,1)*size(train_set_x_orig,2)*size(train_set_x_orig,3);
train_set_x_flatten = reshape(train_set_x_orig,[size_train,size(train_set_x_orig,4)]);

size_test = size(test_set_x_orig,1)*size(test_set_x_orig,2)*size(test_set_x_orig,3);
test_set_x_flatten = reshape(test_set_x_orig,[size_test,size(test_set_x_orig,4)]);

%% standardize dataset.
train_set_x = double(train_set_x_flatten / 255);
test_set_x = double(test_set_x_flatten / 255);
train_set_y = double(train_set_y_orig);
test_set_y = double(test_set_y_orig);
%% Model Implementation
num_iterations = 3000;
learning_rate = 0.005;

X_train = train_set_x;
Y_train = train_set_y;
X_test = test_set_x;
Y_test = test_set_y;

[Result] = model_LogReg(X_train, Y_train, X_test, Y_test, num_iterations, learning_rate);
Iter_plot = 100:100:num_iterations;
plot(Iter_plot,Result.costs)
disp(['Train accuracy of the model ' num2str(Result.train_accuracy,'%.2f') ,'%'])
disp(['Test accuracy of the model ' num2str(Result.test_accuracy,'%.2f') ,'%'])

