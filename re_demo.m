% 利用正则表达式过滤文本
% clc; clear; close all;
data = load('data_sample_to_CJL.mat');
data = data.input_all_files_name;

% 统计其中含有"run1"字样的样本个数
index_run1 = [];
for i = 1:length(data)
    if contains(data{i}, 'run1')
        index_run1(end + 1) = i;
    end
end
num_run1 = length(index_run1);
fprintf('含有"run1"字样的样本个数: %d\n', num_run1)

% 并提取"fs"字样前的数字
data_contains_run1 = data(index_run1);
num_before_fs = [];
for i = 1:length(data_contains_run1)
    element = data_contains_run1{i};
    [head, tail] = regexp(element, '_\d+fs');
    num_before_fs(end + 1) = str2num(element(head + 1: tail - 2));
end
fprintf('在这些样本中，"fs"字样前的数字依次为: ')
disp(num_before_fs)
