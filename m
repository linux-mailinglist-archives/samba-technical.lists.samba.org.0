Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99E1385C9
	for <lists+samba-technical@lfdr.de>; Sun, 12 Jan 2020 11:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5PgBvi5t8NUt9js4hIjmgr6ljOIFVeB9x0i8xFBVVaI=; b=kpeaid+0yRfTlQOeuDBqhwg2v9
	tUt4QpwJHar1QhQhaz8kaV/AGaJlr5MmKzIAZSaIamLfJ8SR5cEsvV/5bn1agYzEuPAJ3e76QhPp3
	NvtFO8aDeA+UbLPB24s1m+Gri2Lm2gaPpb+rvoYgXPrIbdjAVD2fpx4WDanYNTzpl6NvEmOwC7BAL
	MMoO7aumDENO4Yrne4BXK2HDbUsDj57lPbb0ZkbZctV5Q36Mw45Sde97Ra5Fzog/SMNimiG6zTWxS
	LmR+EarJjAKjORRG3SA7t32IDOwH9rb5Zd7fjysbegoOhaeivmm/URxM/4XAI6RsKEdwRfFikUsEO
	3e5l1yeg==;
Received: from localhost ([::1]:53562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iqaI3-0038gL-Fg; Sun, 12 Jan 2020 10:16:15 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:38880) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqaHl-0038gE-5L
 for samba-technical@lists.samba.org; Sun, 12 Jan 2020 10:16:13 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id C76EF8109E
 for <samba-technical@lists.samba.org>; Sun, 12 Jan 2020 23:00:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1578823209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=5PgBvi5t8NUt9js4hIjmgr6ljOIFVeB9x0i8xFBVVaI=;
 b=bRP0HGSbot9jlGLGHESC7dG0k6u9ppwUgS5GqUvRZT8M3HHLl5uBpM7km4qyBivvP+2LCQ
 qOqXoaUNvrtkeQ6ikn6LzT30RQNPtF9+jUKHgPlmpJsGWtrQ0+PxTJQ57ckAaZmbsYTqwG
 Bvhv2575TtcdOCZDCqtpNxAt21WP+LbhwE1PTziW+hNsMmfQC4oO7v3zTNxl/EPz5M4pqt
 W3BIlFvRawLQsGPDVdLnWyAlKSNe75LN1aXw3Rkbm1D6E4LF2j/golRaF7UBeW08f8j+mq
 ETR1VGiCU7mdZf3bY/bu+9ynakOgshF+S2Ehg9nDMJ41aRXV4acRmdIfWo8MZw==
Subject: [EXAMPLE] How to add a source3 fuzz target
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
Date: Sun, 12 Jan 2020 23:00:06 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3ACAF0289154C7810A5B15A2"
Content-Language: en-US
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------3ACAF0289154C7810A5B15A2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Maybe you are a Samba developer who has noticed some activity around
automated fuzzing, but you haven't really got your head around how to
add a fuzz target in your subdomain. This message is meant to show you
how easy it is. So easy, in fact, that you might prefer to skip to the
attached patch.

My process for finding this target was:

1. `git grep parse_ -- source3`.

2. look for a function that looks like it
   a. does a bit of work,
   b. probably deals with untrusted data,
   c. is not enmeshed in a whole lot of state.

So already with point 1, you know that YOU can do better.

For point 2, I saw this parse_packet() was filling out nested
structures using a tree of function calls (that's 2a), has a networky
sounding name (2b), and there is no context pointer involved (2c). (If
there was a context pointer, that would be OK if we could create the
context afresh every time, or if it wasn't really modified).

With the target selected, you make a file in lib/fuzzing with a
function called LLVMFuzzerTestOneInput(). That is libfuzzer's entry
point. LLVMFuzzerTestOneInput() essentially takes a datablob and
returns 0 (always 0 -- you report errors with abort()). This is
sort of enough to fuzz nmblib's parse_packet:

  int LLVMFuzzerTestOneInput(uint8_t *input, size_t len)
  {
          struct packet_struct *p = NULL;
          struct in_addr ip = {
                  0x0100007f /* 127.0.0.1 */
          };

          p = parse_packet((char *)input,
                           len,
                           NMB_PACKET,
                           ip,
                           1234);
          return 0;
  }

but that's a bit useless. It [hopefully] tells us that parse_packet()
doesn't crash, but it doesn't warn us if it is returning deadly
structures. So we add in a round trip using build_packet() and a test
to ensure p->packet.nmb.question.question_name.name exists, which I
think something somewhere assumes is true. Anybody who knew anything
about nmb packets could add more checks, which they would do by
straight out doing the thing that might crash, not by making careful
assertions.

To compile it we add a stanza to wscript_build using the standard mix
of copy, paste, trial, error, and guesswork. Then you need to compile
it differently. What I use is a wrapper around libfuzzer and compilers
called Honggfuzz. The steps to get it are something like:

$  git clone git@github.com:google/honggfuzz.git
$  cd honggfuzz
$  make

then back in samba, you need a fancy configure line:

$  rm -r bin
$  buildtools/bin/waf -C \
                --without-gettext \
                --enable-debug \
                --enable-developer \
                --enable-libfuzzer \
                CC=$PATH_TO_HONGGFUZZ/hfuzz_cc/hfuzz-clang \
                configure \
                LINK_CC=$PATH_TO_HONGGFUZZ/hfuzz_cc/hfuzz-clang \
                --disable-warnings-as-errors  \
                --abi-check-disable
$  make -j

Maybe not all of those options are necessary, but at some point they
were each for something. I think at least you'll need
'--enable-libfuzzer CC=...'.

Then run it:

$  mkdir nmb_parse_seeds
$  $PATH_TO_HONGGFUZZ/honggfuzz  -V -T -F 50000 \
          -i nmb_parse_seeds \
          -- bin/fuzz_nmblib_parse_packet

This will create fuzz packets based on the the examples in
./nmb_parse_seeds, of which there are initially none. It will mutate
and add to these (initially mutating the empty string), trying to find
packets that lead to new code pathways. While it doing this it shows
you how it's going on a console dashboard. If a packet causes a crash
or abort (or with -T, a timeout), it saves that packet in a weirdly
named file and writes a report in (by default) HONGGFUZZ_REPORT.TXT.

To replay a packet in gdb or valgrind, you just do this:

$  gdb --args ./bin/fuzz_nmblib_parse_packet $the_file_name

and the problem should become apparent.

Needless to say, I have found no crashes with this particular patch,
and I suspect it is not actually a very good target. But perhaps it is
an excellent target and we just happen to have very good code!

The main point is that you should consider adding targets; now that we
have made fuzzing Samba easy, we want to ensure that *we* are the ones
doing it.

cheers,
Douglas

--------------3ACAF0289154C7810A5B15A2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fuzz-add-nmblib-parse_packet-target.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-fuzz-add-nmblib-parse_packet-target.patch"

From e49e685f6eea48a93d3deee83de4eba1bd014dd7 Mon Sep 17 00:00:00 2001
From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Date: Fri, 10 Jan 2020 15:44:27 +1300
Subject: [PATCH] fuzz: add nmblib/parse_packet target

We want to ensure that parse_packet() can parse a packet without
crashing, and that that parsed packet won't cause trouble further down
the line.

Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
---
 lib/fuzzing/fuzz_nmblib_parse_packet.c | 56 ++++++++++++++++++++++++++
 lib/fuzzing/wscript_build              |  5 +++
 2 files changed, 61 insertions(+)
 create mode 100644 lib/fuzzing/fuzz_nmblib_parse_packet.c

diff --git a/lib/fuzzing/fuzz_nmblib_parse_packet.c b/lib/fuzzing/fuzz_nmblib_parse_packet.c
new file mode 100644
index 00000000000..7b35abe9f97
--- /dev/null
+++ b/lib/fuzzing/fuzz_nmblib_parse_packet.c
@@ -0,0 +1,56 @@
+/*
+  Fuzz NMB parse_packet
+  Copyright (C) Catalyst IT 2020
+
+  This program is free software; you can redistribute it and/or modify
+  it under the terms of the GNU General Public License as published by
+  the Free Software Foundation; either version 3 of the License, or
+  (at your option) any later version.
+
+  This program is distributed in the hope that it will be useful,
+  but WITHOUT ANY WARRANTY; without even the implied warranty of
+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  GNU General Public License for more details.
+
+  You should have received a copy of the GNU General Public License
+  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+*/
+
+#include "../../source3/include/includes.h"
+#include "libsmb/libsmb.h"
+#include "libsmb/nmblib.h"
+#include "fuzzing/fuzzing.h"
+
+#define PORT 138
+#define MAX_LENGTH (1024 * 1024)
+char buf[MAX_LENGTH + 1];
+
+
+int LLVMFuzzerTestOneInput(uint8_t *input, size_t len)
+{
+	struct packet_struct *p = NULL;
+	struct in_addr ip = {
+		0x0100007f /* 127.0.0.1 */
+	};
+
+	p = parse_packet((char *)input,
+			 len,
+			 NMB_PACKET,
+			 ip,
+			 PORT);
+	/*
+	 * We expect NULL (parse failure) most of the time.
+	 *
+	 * When it is not NULL we want to ensure the parsed packet is
+	 * reasonably sound.
+	 */
+
+	if (p != NULL) {
+		struct nmb_packet *nmb = &p->packet.nmb;
+		pull_ascii_nstring(buf, MAX_LENGTH,
+				   nmb->question.question_name.name);
+		build_packet(buf, MAX_LENGTH, p);
+		free_packet(p);
+	}
+	return 0;
+}
diff --git a/lib/fuzzing/wscript_build b/lib/fuzzing/wscript_build
index 75c41ac83f4..affe7099063 100644
--- a/lib/fuzzing/wscript_build
+++ b/lib/fuzzing/wscript_build
@@ -27,6 +27,11 @@ bld.SAMBA_BINARY('fuzz_reg_parse',
                  deps='fuzzing samba3-util smbconf REGFIO afl-fuzz-main',
                  fuzzer=True)
 
+bld.SAMBA_BINARY('fuzz_nmblib_parse_packet',
+                 source='fuzz_nmblib_parse_packet.c',
+                 deps='fuzzing libsmb afl-fuzz-main',
+                 fuzzer=True)
+
 bld.SAMBA_BINARY('fuzz_regfio',
                  source='fuzz_regfio.c',
                  deps='fuzzing samba3-util smbconf REGFIO afl-fuzz-main',
-- 
2.20.1


--------------3ACAF0289154C7810A5B15A2--

