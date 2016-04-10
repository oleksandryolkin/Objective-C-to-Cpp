//
//  cppsearch.cpp
//  ObjC2Cpp
//
//  Created by Alexander Yolkin on 4/9/16.
//  Copyright © 2016 Alexander Yolkin. All rights reserved.
//

#include "cppsearch.hpp"
#include "SearchManager-C-Interface.h"

void performCppSearch(const char* searchTemplate, const char* searchPath)
{
    printf("perform search in cpp for %s in %s\n", searchTemplate, searchPath);
    
    char name[] = "FoundFileName";
    char path[] = "FoundFilePath";
    
    char* pname = &name[0];
    char* ppath = &path[0];
    
    fileFound(pname, ppath);
}