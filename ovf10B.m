clear all;
% Параметры задачи
L = 1;           % Длина стержня
T = 0.1;         % Общее время
Nx = 100;        % Количество шагов по x
Nt = 100;        % Количество шагов по времени
alpha = 0.01;    % Параметр для схемы Кранка-Николсона

% Шаги по пространству и времени
dx = L / Nx;
dt = T / Nt;

% Инициализация сетки и начальных условий
x = linspace(0, L, Nx+1);
u = zeros(Nx+1, Nt+1);

% Начальные условия
u(:,1) = x.*(1 - x./L).^2;

% Матрицы для метода прогонки
A = diag(ones(Nx-1,1)*(1+alpha),1) + diag(ones(Nx-1,1)*(1-alpha),-1) - 2*eye(Nx)/dx^2;
B = diag(ones(Nx-1,1)*(1-alpha),1) + diag(ones(Nx-1,1)*(1+alpha),-1) + 2*eye(Nx)/dx^2;

% Решение схемой Кранка-Николсона
for n = 1:Nt
    b = B*u(2:end-1,n);
    b(1) = b(1) + (1-alpha)*u(1,n)/dx^2;
    b(end) = b(end) + (1-alpha)*u(end,n)/dx^2;
    
    % Решение системы линейных уравнений методом прогонки
    u(2:end-1,n+1) = thomasAlgorithm(A, b, Nx-1);
end

% Вычисление максимальной температуры на каждом временном шаге
maxTemperature = max(u(:,2:end));

% Визуализация результатов
figure;
plot((1:Nt)*dt, maxTemperature);
xlabel('Время');
ylabel('Максимальная температура');
title('Зависимость максимальной температуры от времени');

% Функция для метода прогонки (алгоритм Томаса)
function x = thomasAlgorithm(A, b, n)
    for i = 2:n
        m = A(i,i-1)/A(i-1,i-1);
        A(i,i) = A(i,i) - m*A(i-1,i);
        b(i) = b(i) - m*b(i-1);
    end
    
    x = zeros(size(b));
    x(n) = b(n)/A(n,n);
    
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1)*x(i+1))/A(i,i);
    end
end