Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30465123113
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 17:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=o/Gs+yzsrbAH3+/a4PW5lh+oO04Qm1mlm9b/Fvcy3Vc=; b=LoHHDDS3ilHEz932B55B39iAyW
	RmNWjAnbul8U0cThZQ5Q8RUG1MVR2jwdtIH7vJANURE1l8q4l8LpZU1qsnFRHwyYkgBXkGLrBYxz4
	rnQRGUVUgBFz0J/pm/Huy+FtrxojK1ye4oARAxh0lKxjYRagl7L2zApIeLUeb14N13O18yfRXWnO/
	LnWWDcfUwL6IJxtu4jn/ptlMh5/W6v3CYdXTiuGg1V8nFHIWDRJ9p+yaWQn8rdhTdNlYZP4goSfmd
	0GvEKU0n0PQ21bEVcb/DHfkeFq+bATEJVdRs5F5jIOxVXJFfzLAStIH+y4uqa6RMQzhw/vZN+70wj
	Q9j13ZMg==;
Received: from localhost ([::1]:59046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihFL9-007WMw-HG; Tue, 17 Dec 2019 16:04:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihFL1-007WMp-U4
 for samba-technical@lists.samba.org; Tue, 17 Dec 2019 16:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=o/Gs+yzsrbAH3+/a4PW5lh+oO04Qm1mlm9b/Fvcy3Vc=; b=d2QdoKkm7E2LrA4uaK+XLTLZYG
 hN99YGPg+Gh7Wdu0BD8GYoi8BpaKci9HXU+S4y3IeiN9lSgMdmsAlZ9riduTNHs3ZCodXRD6333jS
 9/jliM9pCJ3ylUpIIlOv9+xhc5sRtCEBeCLMS3M5y0/AszT2zEJJjL6kqv1hYGKs5u5qcz3aXQ2QM
 qN/Ez+ltXnU4EYyDK+rXt+KT72i19gzNCLHigNVc9UC3oaU0OTVcgOoAT/qtMeMFJBTz+kcm8fr7i
 B5iyalWW2QgThLQvS+OX0DVtRW5JXxM873e6I30/I1dzycDRqC6bVB700bdIf/zD2K4eP+idRyzeA
 Ka9LPjZRBxlPHaY4VQDtKbD7LHqmM7t8lzcja6AVOy+vNlEagdF6uZ7kpP1yjk+Rp2EOYznMU8dyV
 i1NjXk6/lrdjg5urNbufn0whBYfE7MvOv4De8O9F8fPYnQa0Ri9zhL+hxi933Q3iPhzS78qA1eg/a
 urhvChp/N+zjZC6ETEqZpfCy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihFL1-0004sN-7X; Tue, 17 Dec 2019 16:04:43 +0000
Date: Tue, 17 Dec 2019 18:04:40 +0200
To: Isaac Boukris <iboukris@gmail.com>
Subject: Re: ldb: LANG=tr_TR.UTF-8 make test - fails
Message-ID: <20191217160440.GC1458792@onega.vda.li>
References: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On ti, 17 joulu 2019, Isaac Boukris via samba-technical wrote:
> Hi,
> 
> I'm looking into this bug, which I can reproduce on master:
> https://bugzilla.redhat.com/show_bug.cgi?id=1743531
> 
> In short it looks like running the ldb tests with tr_TR.UTF-8 locale causes
> this failure:
> 
> Running Python test with /usr/bin/python3: tests/python/index.py
> ...F...FF...F......F...FF...F....
> ======================================================================
> FAIL: test_delete_index_multi_valued_truncated_keys
> (__main__.MaxIndexKeyLengthTests)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "tests/python/index.py", line 999, in
> test_delete_index_multi_valued_truncated_keys
>     b"0123456789abcde1" + b"0123456789abcde1")
>   File "tests/python/index.py", line 98, in checkGuids
>     self.assertEqual(len(res), 1)
> AssertionError: 0 != 1
> 
> Does anyone have a clue how to look further or how the locale impacts
> here ?

Most likely it is GUID versus Guid in Turkish locale:

$ for i in tr_TR en_US ru_RU ; do LC_CTYPE=$i.UTF-8 ~/tmp/strncasecmp Guid GUID ; done
tr_TR.UTF-8: Guid ? GUID = 32
en_US.UTF-8: Guid ? GUID = 0
ru_RU.UTF-8: Guid ? GUID = 0

-- 
/ Alexander Bokovoy

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="strncasecmp.c"

#include <stdio.h>
#include <strings.h>
#include <string.h>
#include <locale.h>

int main(int argc, const char** argv) {
	char * locale = setlocale(LC_CTYPE, "");
	
	printf("%s: %s ? %s = %d\n", locale, argv[1], argv[2], strncasecmp(argv[1], argv[2], strlen(argv[1])));
	return 0;
}

--SUOF0GtieIMvvwua--

