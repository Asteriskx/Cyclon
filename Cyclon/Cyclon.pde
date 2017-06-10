//-----------------------------------------------------
// Cyclon by Asterisk. 2017-06-10
// Agenda : Digital Arts for hexagons.
// ※ Using Processing version for 3.3.3
//-----------------------------------------------------

//-----------------------------------------------------
// Const Variable
//-----------------------------------------------------
public static final int WID    = 500;
public static final int HEI    = WID;

public final color strokeColor = color(  0, 200, 200 );
public final color bgColor     = color( 10,  20,  60 );
public final color bkColor     = color(  0,   0,   0 );

//-----------------------------------------------------
// Static Variable
//-----------------------------------------------------
public static int maxParam = 300;
public static int frame    = 25;

//-----------------------------------------------------
// Global Variable
//-----------------------------------------------------
public float offsetX;
public float offsetY;
public float blur;

public float status = random( 1.0 );

//-----------------------------------------------------
// Setting
// Argument : None
// Return   : None
//-----------------------------------------------------
public void settings(){
    size( WID, HEI, P3D ); 
}

//-----------------------------------------------------
// Setup
// Argument : None
// Return   : None
//-----------------------------------------------------
void setup() {
    background( bkColor ); 
    frameRate( frame );
    blendMode( ADD );
    strokeWeight( 3 );
}

//-----------------------------------------------------
// Draw
// Argument : None
// Return   : None
//-----------------------------------------------------
public void draw(){
    background( bgColor );
    float randN = noise( status );
  
    for( int i = maxParam; i > 0; i -= 5 ){
        pushMatrix();
            translate( width / 2, height / 2 );
            rotate( radians( frameCount * i / 5. ) );
        
            offsetX = cos( radians( 5 * i ) ) * 3;
            offsetY = sin( radians( 5 * i ) ) * 3;
            blur    = min( i, 6 );
            
            stroke( strokeColor );
            fill( bgColor );
            strokeWeight( 1 );
            
            line( 0, 0, 
                  2.5 + i * 2.5 * sin( randN * TWO_PI ), 
                  7.5 + i * 5.0 * cos( randN * TWO_PI ) );
                  
            strokeWeight( 3 );
            fill( strokeColor );
            
            createHexagon( 2.5 + i * 2.5 * sin( randN * TWO_PI ), 
                           7.5 + i * 5.0 * cos( randN * TWO_PI ), 
                           25.0 );
                           
            createHexagon( -( 2.5 + i * 2.5 * sin( randN * TWO_PI ) ), 
                           -( 7.5 + i * 5.0 * cos( randN * TWO_PI ) ), 
                           25.0 );
            
        popMatrix();
    }
    
    status += 0.01;
}

//-----------------------------------------------------
// createHexagon
// Argument : float sx -> Making Hexagon to center X point.
//          : float sy -> Making Hexagon to center Y point.
//          : float size -> Making Hexagon Size.
// Return   : None
//-----------------------------------------------------
public void createHexagon( float sx, float sy, float size ) { 
  final float[] COS       = { 1, 0.5, -0.5, -1, -0.5, 0.5 }; 
  final float[] SIN       = { 0, 0.8660254,  0.8660254, 0, -0.86602524, -0.86602524 };
  final float   RADIUS    = size / 2;
  final int     HEXAGON   = 6;
  
  beginShape();
    for(int i = 0; i < HEXAGON; i++ ){
      float tx = COS[i] * RADIUS + sx;
      float ty = SIN[i] * RADIUS + sy;
      vertex( tx, ty ); // Calculate to vertex(Top Point)
    }
  endShape( CLOSE );
}

//-----------------------------------------------------
// mousePressed
// Argument : None
// Return   : None
//-----------------------------------------------------
public void mousePressed(){
    // NOP
}

//-----------------------------------------------------
// keyPressed
// Argument : None
// Return   : None
//-----------------------------------------------------
public void keyPressed(){
    // NOP
}
