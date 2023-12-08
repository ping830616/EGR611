format short
clear all
clc

%% Input parameters
Noofvariables = 2;  % number of variables
C = [8 5];
Info = [2 1; 3 4; 1 -1];
b = [1000; 2400; 350];
s = eye(size(Info,1));
A = [Info s b];

Cost = zeros(1,size(A,2));
Cost(1:Noofvariables) = C;

%% Constraint BV
BV = Noofvariables+1:1:size(A,2)-1;

%% Calculate zj-Cj row
zjcj = Cost(BV)*A - Cost;

%% for Print Table
zcj = [zjcj ; A];
SimpTable = array2table(zcj);
SimpTable.Properties.VariableNames(1:size(zcj,2)) = {'x_1','x_2','s_1','s_2','s_3','Sol'};


%%%% SIMPLEX METHOD START

RUN = true;
while RUN

if any(zjcj<0);    % check if any negative value is there
        fprintf('    The Current BFS is NOT Optimal \n ')
    fprintf('\n ========== THE NEXT ITERATION RESULTS =========== \n')
    disp('OLD Basic Variable (BV) = ');
    disp(BV);

    %% Finding The entering variable
    zc = zjcj(1:end-1);
    [EnterCol, pvt_col] = min(zc);
    fprintf(' The Minimum Element in zj-cj row is %d Corresponding to Column %d \n', EnterCol,pvt_col);
    fprintf(' Entering variable is %d \n ',pvt_col);

    %% Finding the leaving variable
    sol = A(:,end);
    Column = A(:,pvt_col);
        if all(Column<=0)
            error('LPP is Unbounded. All entries <=0 in column %d',pvt_col);
        else

    for i=1:size(Column,1)
        if Column(i)>0
            ratio(i)=sol(i)./Column(i);
        else
            ratio(i)=inf;
        end
    end
    
    %%%% Finding the minimum
        [MinRatio, pvt_row] = min(ratio);
        fprintf(' Minimum Ratio corresponding to PIVOT Row is %d \n', pvt_row);
        fprintf(' Leaving variable is %d \n ', BV(pvt_row));

        end

        BV(pvt_row)=pvt_col;
        disp('New Basic Variables (BV) =');
        disp(BV)
    %% Pivot key
    pvt_key = A(pvt_row,pvt_col);

        %%% Update the table for next iteration
    A(pvt_row,:) = A(pvt_row,:)./pvt_key;
        for i=1:size(A,1)
            if i~= pvt_row
                A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:); 
            end

            zjcj = zjcj - zjcj(pvt_col).*A(pvt_row,:);

            %% for Printing purpose
            zcj = [zjcj ; A];
            Table = array2table(zcj);
            Table.Properties.VariableNames(1:size(zcj,2)) = {'x_1','x_2','s_1','s_2','s_3','Sol'};

            BFS = zeros(1,size(A,2));
            BFS(BV) = A(:,end);
            BFS(end) = sum(BFS.*Cost);
            Current_BFS = array2table(BFS);
            Current_BFS.Properties.VariableNames(1:size(Current_BFS,2)) = {'x_1','x_2','s_1','s_2','s_3','Sol'}
        end
        
        else
                RUN=false;
                fprintf(' ======== ***************************** ======== \n')
                fprintf('   The Current BFS is Optimal \n')
                fprintf(' ======== ***************************** ======== \n')
        end

end 


%% The alternative way to solve this!
clear all;
c=[-8, -5]'; 
A=[2,1;3,4;1,-1];
b=[1000,2400,350]';
options=optimoptions('linprog','Display','iter');
[xsol,fval,exitflag,output]=linprog(c,A,b,[],[],[],[],options)