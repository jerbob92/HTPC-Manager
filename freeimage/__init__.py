# -*- coding: utf-8 -*-
#=============================================================================
# Copyright   : (c) 2008 semantics GmbH. All Rights Reserved.
# Rep./File   : $URL: http://svn.berlios.de/svnroot/repos/smcfreeimage/smc.freeimage/trunk/src/smc/freeimage/__init__.py $
# Date        : $Date: 2011-05-22 16:24:32 -0700 (Sun, 22 May 2011) $
# Author      : Christian Heimes
# License     : FreeImage Public License (FIPL)
#               GNU General Public License (GPL)
# Worker      : $Author: heimes $
# Revision    : $Rev: 5 $
# Purpose     : smc.freeimage package
#=============================================================================
#
# COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" BASIS, WITHOUT 
# WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT 
# LIMITATION, WARRANTIES THAT THE COVERED CODE IS FREE OF DEFECTS, MERCHANTABLE,
# FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE RISK AS TO THE
# QUALITY AND PERFORMANCE OF THE COVERED CODE IS WITH YOU. SHOULD ANY COVERED
# CODE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY 
# OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR 
# CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF
# THIS LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER EXCEPT UNDER
# THIS DISCLAIMER.
#

import sys
import struct

iswindows = (sys.platform == "win32")
is64 = (struct.calcsize("P") * 8 == 64)

from freeimage._freeimage import *
from freeimage.enums import *
