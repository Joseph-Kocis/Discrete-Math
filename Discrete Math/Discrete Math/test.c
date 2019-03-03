//
//  test.c
//  Discrete Math
//
//  Created by Jody Kocis on 3/3/19.
//  Copyright © 2019 Joseph Kocis. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include "Discrete Math-Bridging-Header.h"

result *getResult(char str[]) {
    result *answer = malloc(sizeof(result));
    
    
    answer->header = malloc(sizeof(char*) * 3);
    answer->header[0] = malloc(sizeof(char) * 2);
    answer->header[1] = malloc(sizeof(char) * 2);
    answer->header[2] = malloc(sizeof(char) * 2);
    
    answer->header[0][0] = 'a';
    answer->header[0][1] = '\0';
    
    answer->header[1][0] = 'b';
    answer->header[1][1] = '\0';
    
    answer->header[2][0] = 'c';
    answer->header[2][1] = '\0';
    
    
    answer->col_size = 3;
    answer->row_size = 3;
    
    answer->grid = malloc(sizeof(int *) * 3);
    answer->grid[0] = malloc(sizeof(int) * 3);
    answer->grid[1] = malloc(sizeof(int) * 3);
    answer->grid[2] = malloc(sizeof(int) * 3);
    
    answer->grid[0][0] = 0;
    answer->grid[0][1] = 1;
    answer->grid[0][2] = 0;
    
    answer->grid[1][0] = 1;
    answer->grid[1][1] = 0;
    answer->grid[1][2] = 0;
    
    answer->grid[2][0] = 0;
    answer->grid[2][1] = 0;
    answer->grid[2][2] = 1;
    return answer;
}
