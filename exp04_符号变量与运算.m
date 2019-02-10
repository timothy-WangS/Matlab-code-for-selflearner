%���Ŷ��󴴽�
    %sym����
        p = sin(pi/3);
        P = sym(p, 'r');  % ����ֵp�������ų���P��'d'������'f'�����ʽ�ĸ�����'e'�����������'r'������
    %syms����
        syms a b c d;  % �������ű���
        f = a8*b^2 + c/d;  % �������ź���
    %���ɷ��ű���
        %Ĭ��x��û��������x������С��ͬ��ASCII�����ȣ���д��ĸ������Сд��ĸ֮��
        symvar(f);  % �г�f�����з��ű���
        symvar(f, 3);  % ��˳���г�f��3�����ű���
    %��������
        %���Ӽ��˳���
        % 'ת�� �� ==��� �� ~=���� 
        % sin, cos, tan; asin, acos, atan ���Ƿ�����
        % sinh, cosh, tanh; asinh, acosh, atanh ˫����˫��
        % conj�������real����ʵ����imag�����鲿��abs����ģ��angle��������
        % diag����Խǣ�triu���������ǣ�tril���������ǣ�inv�����det����ʽ��rank�ȣ�poly��������ʽ��
        % |----expm����ָ��������eig��������ֵ������������svd����ֵ�ֽ⣻
    %���Ŷ���ʶ���뾫��ת��
        class(f);  % ����f������
        isa(f, 'double');  % �ж�f�Ƿ�Ϊdouble�ͣ��Ƿ���1
        whos;  % ���������ڴ��������" whos f "������f������
        digits;  % ��ʾ��ǰ���ڼ���ľ���
        digits(16);  % �����㾫�ȸ�Ϊ16λ�����;�����ʱ���Լӿ���������ٶȻ���ٿռ�ռ��
        a16 = vpa(sqrt(2));  % vpa���������ʹsqrt(2)���㰴�չ涨�ľ���ִ��
        a8 = vpa(sqrt(2), 8);  % ��vpa�ڿ��ƾ��ȣ��뿪��һ�����Ȼָ�
%���Ŷ���ʽ��������
    %���ű����ʽ���໥ת��
        %����ʽչ������
            g = expand(f);  % չ��
            h = collect(g);  % ����(Ĭ�ϰ�x����)
            h1 = collect(f, x);  % ��x�����������еȣ�
            preety(h1);  % �ѱ��ʽ��Ϊһ����д��ʽ����ʡ��*�ȣ�
        %��ʽ�ֽ�չ��������
            f = factor(h);  % ��ʽ�ֽ�
            factor(12);  % ��12�ֽ�������
            g1 = horner(f);  % ��fתΪǶ����ʽ���ؾ����㷨��
        %����ʽ��������ֵ����
            fW = subexpr(f, 'W');  % �Զ���f�г���������ʽ������ΪW���Ӷ������ʽ��ΪfW
            f = a+b*x;
            f1 = subs(f, cos(d));  % ��f�е����ɱ�����cos(d)������cos(d)����Ϊ����
            f2 = subs(f1, cos(d), cos(c));  % ��f1�е�cos(d)��cos(c)����
    %���Ŷ���ʽ������ʽ�����
        syms a b c;
        n = [a, b, c];
        roots(n);  % ����Ŷ���ʽax^2+bx+c�ĸ�
        n = [1, 2, 3];
        roots(n);  % ����Ŷ���ʽ����a=1, b=2, c=3�ĸ�
    %�������븴�Ϻ���
        fi = finverse(f, x);  % ��f�еı���x�󷴺���
        syms x y z t;
        f = x^-t;
        g = sin(y);
        h1 = compose(f, g);  % ��f(g(x)),Ĭ����g(z)����f�е�x����sin(y)^-t
        h2 = compose(f, g, t);  % ��f(g(t)),��sin(t)^-t
        h3 = compose(f, g, x, z);  % ��f(g(z)),��g(z)����f�е�x
        h4 = compose(f, g, t, z);  % ��f(g(z)),��g(z)����f�е�t
%����΢����
    %�����ļ��޺ͼ�������
        % ����a��b
        %����
            limit(f, x, a);  % ��f(x), x->a
            limit(f, a);  % Ĭ�ϱ���->a
            limit(f);  % Ĭ�ϱ���->0
            limit(f, x, a, 'right');  % ��f(x), x->a+, 'left' x->a-
        %������������
            %���
                symsum(s, x, a, b);  % ������ʽs����x��a��b�ļ����ͣ���symsum(s, x, [a b])��symsum(s, x, [a;b])
                symsum(s, a, b);  % ����sĬ�ϱ�����a��b�ļ�����
                symsum(s);  % ����sĬ�ϱ�����0��n-1�ļ�����
            %һά̩��չ��
                taylor(f, x, a);  % f��x=a��չ��Ϊ���̩�ռ���
                taylor(f, x);  % f��x=0��չ��Ϊ���̩�ռ���
                taylor(f);  % f��Ĭ�ϱ���=0��չ��Ϊ���̩�ռ���
    %����΢��
        %�������󵼣�������ƫ����
            n = 5;  % ����n
            fn = diff(f, x, n);  % f��x��n�׵�
            f1 = diff(f, x);  % f��x��1�׵�
            diff(f, n);  % f��Ĭ�ϱ�����n�׵�
            diff(f);  % Ĭ�ϱ���1�׵�
        %��Ԫƫ��
            fxy = diff(f, x, y);  % ����xƫ��������yƫ��
            fxyz = diff(f, x, y, z);  % ����xƫ��������yƫ��,����zƫ��
        %��������
            % û��ר�Ź�ʽ������dy/dx = -(Fx/Fy)
            DF_dx = -diff(f, x)/diff(f, y);
        %�ſɱ�����ʽ
            % F = [f1, f2...], v = [x, y, z...]
            jacobian(F, v);  % ���Ϊ[f1��xƫ����f2��xƫ��...][f1��yƫ��,f2��yƫ��...][...]...
        %��ɢ���ݲ�֣�����
    %���Ż���
        %��������
            int(f, x, a, b);  % ����f����x��ab���䶨����
            int(f, a, b);  % ����fĬ�ϱ�����ab���䶨����
            int(f, x);  % ����f����x��������
            int(f);  % ����fĬ�ϱ�����������
        %���Ż��ֱ任������
            % ����Ҷ��������˹��Z�任
%���ŷ������
    %���Ŵ�������
        %һԪ����
            eqn1 = a*x==b;
            S = solve(eqn1);  % ����eqn���Ž�
        %��Ԫ������
            eqn21 = x-y==a;
            eqn22 = 2*x+y==b;
            [Sx, Sy] = solve(eqn21, eqn22, x, y);  % [Svar1,...SvarN]=solve(eqn1,...eqnM, var1,...varN),MN��һ�����
            [Sxn, Syn] = solve(eqn21, eqn22, x, y, 'ReturnCondition', true);  % ���ϲ���ReturnCondition�ɷ���ͨ�⼰�������
            % ��������(��������true��Ч)
                % IgnoreProperty�����Ա�������ʱһЩ����
                % IgnoreAnalyticConstraints�����Է������ƣ�
                % MaxDegree������3�����Խ⣻
                % PrincipleValue������ֵ
                % Real����ʵ����
        %������fsolve
            X = fsolve(fun, X0, optimset(option));  % fun����.m�ļ�����X0�����ֵ��optionѡ����('Display','off')����ʾ�м�����
    %���ų�΢�ַ�����⣿����
    %һάƫ΢�ַ�����⣿����