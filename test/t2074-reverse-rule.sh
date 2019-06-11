#! /bin/sh -e
# tup - A file-based build system
#
# Copyright (C) 2010-2012  Mike Shal <marfey@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Try a rule where we use the output names to drive the foreach

. ./tup.sh
check_no_windows symlink
cat > Tupfile << HERE
link-y += ar
link-y += vi
: foreach \$(link-y) <| ln -s %f %o <| busybox
HERE
tup touch busybox Tupfile
update

tup_dep_exist . 'ln -s busybox ar' . ar
tup_dep_exist . 'ln -s busybox vi' . vi

eotup
