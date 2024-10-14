int cellSize = 3;

int[][] curGrid;
int[][] nextGrid;

boolean showGrid = false;
boolean paused = false;

color c1 = color(0, 213, 255);
color c2 = color(83, 240, 93);
color fillC = c1;

void setup()
{
  size(1600, 1200);
  curGrid = new int[width / cellSize][height / cellSize];
  
  setupGrid(curGrid);
  curGrid[10][10] = 1;
  curGrid[10][11] = 1;
  curGrid[10][12] = 1;
  drawGrid(curGrid);
  delay(300);
  curGrid = updateGrid(curGrid);
  drawGrid(curGrid);
}

void draw()
{
  if (!paused)
  {
    delay(100);
    curGrid = updateGrid(curGrid);
    drawGrid(curGrid);
  }
}

int[][] updateGrid(int[][] grid)
{
  int[][] output = new int[grid.length][grid.length];
  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      if (i > 0 && i < (grid.length - 1) && j > 0 && j < (grid[i].length - 1))
      {
        int x = 0;
        int[] neighbors = {grid[i-1][j-1], grid[i][j-1], grid[i+1][j-1], grid[i-1][j], grid[i+1][j], grid[i-1][j+1], grid[i][j+1], grid[i+1][j+1]};
        for (int n : neighbors)
        {
          if (n == 1)
          {
            x++;
          }
        }
        if (grid[i][j] == 1 && x < 2)
          output[i][j] = 0;
        else if (grid[i][j] == 1 && x >= 2 && x <= 3)
          output[i][j] = 1;
        else if (grid[i][j] == 1 && x > 3)
          output[i][j] = 0;
        else if (grid[i][j] == 0 && x == 3)
          output[i][j] = 1;
      }
      else if (i == 0 && i < (grid.length - 1) && j > 0 && j < (grid[i].length - 1))
      {
        int x = 0;
        int[] neighbors = {grid[i][j-1], grid[i+1][j-1], grid[i+1][j], grid[i][j+1], grid[i+1][j+1]};
        for (int n : neighbors)
        {
          if (n == 1)
          {
            x++;
          }
        }
        if (grid[i][j] == 1 && x < 2)
          output[i][j] = 0;
        else if (grid[i][j] == 1 && x >= 2 && x <= 3)
          output[i][j] = 1;
        else if (grid[i][j] == 1 && x > 3)
          output[i][j] = 0;
        else if (grid[i][j] == 0 && x == 3)
          output[i][j] = 1;
      }
      else if (i > 0 && i == (grid.length - 1) && j > 0 && j < (grid[i].length - 1))
      {
        int x = 0;
        int[] neighbors = {grid[i-1][j-1], grid[i][j-1], grid[i-1][j], grid[i-1][j+1], grid[i][j+1]};
        for (int n : neighbors)
        {
          if (n == 1)
          {
            x++;
          }
        }
        if (grid[i][j] == 1 && x < 2)
          output[i][j] = 0;
        else if (grid[i][j] == 1 && x >= 2 && x <= 3)
          output[i][j] = 1;
        else if (grid[i][j] == 1 && x > 3)
          output[i][j] = 0;
        else if (grid[i][j] == 0 && x == 3)
          output[i][j] = 1;
      }
      else if (i > 0 && i < (grid.length - 1) && j == 0 && j < (grid[i].length - 1))
      {
        int x = 0;
        int[] neighbors = {grid[i-1][j], grid[i+1][j], grid[i-1][j+1], grid[i][j+1], grid[i+1][j+1]};
        for (int n : neighbors)
        {
          if (n == 1)
          {
            x++;
          }
        }
        if (grid[i][j] == 1 && x < 2)
          output[i][j] = 0;
        else if (grid[i][j] == 1 && x >= 2 && x <= 3)
          output[i][j] = 1;
        else if (grid[i][j] == 1 && x > 3)
          output[i][j] = 0;
        else if (grid[i][j] == 0 && x == 3)
          output[i][j] = 1;
      }
      else if (i > 0 && i < (grid.length - 1) && j > 0 && j == (grid[i].length - 1))
      {
        int x = 0;
        int[] neighbors = {grid[i-1][j-1], grid[i][j-1], grid[i+1][j-1], grid[i-1][j], grid[i+1][j]};
        for (int n : neighbors)
        {
          if (n == 1)
          {
            x++;
          }
        }
        if (grid[i][j] == 1 && x < 2)
          output[i][j] = 0;
        else if (grid[i][j] == 1 && x >= 2 && x <= 3)
          output[i][j] = 1;
        else if (grid[i][j] == 1 && x > 3)
          output[i][j] = 0;
        else if (grid[i][j] == 0 && x == 3)
          output[i][j] = 1;
      }
    }
  }
  return output;
}

void drawGrid(int[][] grid)
{
  background(0);  
  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      if (grid[i][j] == 0)
      {
        noFill();
        if (showGrid)
        {
          stroke(fillC);
          strokeWeight(0.5);
        }
         else
          noStroke();
          
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
      else if (grid[i][j] == 1)
      {
        fill(fillC);
        noStroke();
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
    }
  }
}

void setupGrid(int[][] grid)
{
  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      int x = round(random(4));
      if (x == 0 || x == 1)
      {
        grid[i][j] = 1;
      }
      else
      {
        grid[i][j] = 0;
      }
    }
  }
}

void keyPressed()
{
  if (key == 'g')
     showGrid = !showGrid;
  if (key == ' ')
    paused = !paused;
  if (key == 'r')
    setupGrid(curGrid);
  if (key == 'f')
  {
     if (fillC == c1)
       fillC = c2;
     else
       fillC = c1;
  }
}
