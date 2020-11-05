from ortools.sat.python import cp_model


def main():
    model = cp_model.CpModel()

    x_1 = model.NewIntVar(0, 20_000_000, 'x_1')
    x_2 = model.NewIntVar(0, 20_000_000, 'x_2')
    y = model.NewIntVar(0, 20_000_000, 'y')

    model.Add(x_1 + x_2 + 10_000_000 == y)
    model.Add(x_1*20 >= y)
    model.Add(x_2*10 >= y)

    model.Maximize(-(x_1 + x_2))

    solver = cp_model.CpSolver()
    status = solver.Solve(model)

    if status == cp_model.OPTIMAL:
        print('Maximum of objective function: %i' % solver.ObjectiveValue())
        print()
        print('x_1 value: ', solver.Value(x_1))
        print('x_2 value: ', solver.Value(x_2))
        print('y value: ', solver.Value(y))



if __name__ == '__main__':
    main()