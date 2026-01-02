import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wri_custom_clipper/bloc/counter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => CounterBloc())],
        child: WriCustomClipper(),
      ),
    ),
  );
}

class WriCustomClipper extends StatelessWidget {
  const WriCustomClipper({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Practice Clipper Design',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.inc == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Incremented'),
                duration: Duration(milliseconds: 500),
              ),
            );
          } else if (state.inc == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Decremented'),
                duration: Duration(milliseconds: 500),
              ),
            );
          }
        },
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: const Color.fromARGB(255, 250, 226, 4),
                  height: 260,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 238, 221, 71),
                height: 230,
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.yellow,
                  child: Center(
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return Text(
                          state.counter.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrement());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    final firstStart = Offset(size.width / 5, size.height);
    final firstEnd = Offset(size.width / 2.25, size.height - 50);

    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );

    final secondStart = Offset(
      size.width - (size.width / 3.24),
      size.height - 105,
    );
    final secondEnd = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
