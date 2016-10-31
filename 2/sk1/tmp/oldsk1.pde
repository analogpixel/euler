import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;

HColorPool colors;
HDrawablePool pool;

PGraphics createNum(int n) {

	PFont font1 = createFont("disparador_stencil.ttf", 600);
	PGraphics t = createGraphics(width, height);
	t.beginDraw();
	t.textAlign(CENTER);
	t.textSize(300);
	t.text(n, width/2, height/2+150);
	t.endDraw();

	t.save("data/outnum.png");
	return t;
}


void drawNum(int n) {
	H.clearStage();

	createNum(n);
	HDrawablePool pool = new HDrawablePool(n);
	pool.autoAddToStage()
		.add( new HShape("svg1.svg") )
		.add( new HShape("svg2.svg") )
		
		.layout(
			new HShapeLayout().target(
				new HImage("outnum.png")
				)
			)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
					 .enableStyle(false)  // without this colors and strokes will not get applied.
					 //.strokeJoin(ROUND) // gives a smoother output
					 //.strokeCap(ROUND) // gives a smoother output
					 //.strokeWeight(0)
					 .noStroke()
					 //.fill(colors.getColor() )
					 .fill(#ffffff)
					 .size( (int) random(50,50) )
					 //.rotate( (int) random(360) )
					 //.loc( (int)random(width), (int)random(height))
					 .anchorAt(H.CENTER)
					 .rotate( (int) random(360))
					 ;

					 d.randomColors(colors.fillOnly() );
					}

				}
				).requestAll();

		
		H.drawStage();
		//pool.destroy();
		//H.clearStage();

}


void setup(){
	size(800,800);
	H.init(this).background(#202020).use3D(false).autoClear(true);
	
	colors = new HColorPool(#FFFFFF,#F7F7F7,#ECECEC,#0095A8,#00616F,#333333,#FF3300,#FF6600);
}

void draw(){
	//H.drawStage();

// saveFrame("frames/#########.tif"); if (frameCount == 900) exit();
}

int i=0;

void keyPressed() {
	drawNum(i);
	H.drawStage();
	i++;
}