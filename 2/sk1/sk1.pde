PGraphics cn;
int i = 0;
int lastNum = 1;
PFont font2;

PGraphics createNum(int n) {
	int fontSize = 400;
	int adjust = 150;

	if (n > 1000) { fontSize = 280;  adjust=100;}
	if (n > 10000) { fontSize = 230; adjust=100; }
	if (n > 100000) {fontSize = 200; adjust=70; }
	if (n > 1000000) {fontSize = 150; adjust=70;}

	PFont font1 = createFont("disparador_stencil.ttf", fontSize);
	PGraphics t = createGraphics(width, height);
	t.beginDraw();
	t.background(0);
	t.fill(255);
	t.textAlign(CENTER);
	//t.textFont(font1);
	t.textSize(fontSize);
	t.text(n, width/2, height/2+adjust);
	t.endDraw();
	return t;
}

void drawNum(int n) {
	background(200);
	cn = createNum(n);
	int i =0;

	int boxSize = 30;
	if (n > 1000) { boxSize = 20; }
	if (n > 10000) { boxSize = 10; }
	if (n > 100000) {boxSize = 5; }
	if (n > 1000000) {boxSize = 2;}

	textSize(30);
	fill(90);
	text("Fibonacci Sequence: " + n , 30, height-30);
	stroke(90);
	strokeWeight(3);
	rectMode(CORNER);
	noFill();
	rect(10,10, width-20, height-20);
	noStroke();
	rectMode(CENTER);

	while(true) {
		int x = (int) random(width);
		int y = (int) random(height);

		if ( cn.get(x,y) == color(255) ) {
		//fill(50,80);
		//rect(x+3, y+3, boxSize,boxSize);
		fill( nextColor() );
		//noFill();
		stroke( nextColor() );
		strokeWeight(1);
		//rect(x,y,boxSize,boxSize);
		pushMatrix();
		translate(x,y);
		rotate(radians(random(360)));
		rect(0,0, boxSize,boxSize);
		popMatrix();

		i = i + 1;
		}

		if (i >= n) {
			break;
		}
	}

}

int n;

void setup() {
	size(800,800);
	PFont font2 = createFont("disparador_stencil.ttf", 40);
	n = 2;
	noStroke();
	smooth(10);
	fill(255);
	rectMode(CENTER);
	drawNum(1);
	save("outNums/" + n + ".png");
}

void draw() {
}

void keyPressed() {
	
	drawNum(n);
	
	save("outNums/" + n + ".png");
	int t = n;

	n = lastNum + n;
	lastNum = t;


}

color nextColor() {
	color [] colors  = { #FFFFFF,#F7F7F7,#ECECEC,#0095A8,#00616F,#333333,#FF3300,#FF6600 };

	int x = (int) random( colors.length );
	return colors[x];
}