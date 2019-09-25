Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA4BD7F4
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 07:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6USwccmgPzMnOKvaAFeI/L0pzsfpIagOihPDcFt/cVI=; b=ewtOlfu0pgbjX1xb+ERpH2ZJ+t
	Q65MFslXcjbJcWyGoWY1TwbENR3gs+YAZ/h1yXZaPACZlEYZdRrrzOGrO/Hh0n9ceFwN7onL2aWcD
	IiuUbzym7L3dgGHEhDrx21WXoKDPe1Tivq0QpmLbds5O3g7B99gpQvmLW96lMeKXmJUK5DRgfhruI
	8IvMTNR9gD2/zpzEDFndrXGKECtT1YXTcG2omE+X3OfaJ3l2ZDVrebD9J/Y703n9Ym47rfEyaRK4i
	tO4yeN+Gulq3sFv7fAS7yb+NPhOYUwchXWUJzb11sRCXrGZbEf9nsZBFbcDT9zebntV2YvyueXGPj
	JAR9YKTg==;
Received: from localhost ([::1]:49142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD0DB-008Prj-Ne; Wed, 25 Sep 2019 05:51:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60134) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD0D6-008PrW-Ha
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 05:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=6USwccmgPzMnOKvaAFeI/L0pzsfpIagOihPDcFt/cVI=; b=XJFWBkajDlxm4RL6WX+IN9cKFJ
 PJX/erKt8rF+yvtOU/neV35VOH0WAZ0mEdZ+XL6KoGOy3Fmxm1tAbcD2NlvgQb2XfQEod0nhJakq+
 FovcdZu6EatOxwopAJK9J/jsl32Bmd0A6mZ9GFDFJHiVpZMB5XH6/E0VnFKxzAsN7Zo0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD0D5-0002OC-Bd; Wed, 25 Sep 2019 05:51:32 +0000
Message-ID: <1569390687.4377.132.camel@samba.org>
Subject: Re: [PATCH 1/2] s3:tests: Add smbspool_argv_wrapper
To: bmason@redhat.com, samba-technical@lists.samba.org
Date: Wed, 25 Sep 2019 17:51:27 +1200
In-Reply-To: <2aa99e06bac234dd24ad6e2e50762977c0bf51d0.camel@redhat.com>
References: <2aa99e06bac234dd24ad6e2e50762977c0bf51d0.camel@redhat.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-09-24 at 17:37 -0700, Bryan Mason via samba-technical
wrote:
> This patch, along with the next one, is intended to catch problems
> like https://bugzilla.samba.org/show_bug.cgi?id=14128 where CUPS puts
> a sanitized Device URI in argv[0].  This patch creates a utility to
> pass the Device URI in argv[0]; the next patch actually uses this
> utility to perform the test.
> 
> Please review and comment.  Thanks.

Thanks for the patches.  Can you please either:
 - submit them as a merge request to our gitlab repo
 - attach them to a mail

Sadly samba-technical is set up in such a way that your patches have
been munged and credited to the mailing list, not yourself.

See also our contributing instructions (which need work) and copyright
policy:
https://wiki.samba.org/index.php/Contribute
https://www.samba.org/samba/devel/copyright-policy.html

Sorry!

Andrew Bartlett

> [PATCH 1/2] s3:tests: Add smbspool_argv_wrapper
> 
> Before calling a backend like smbspool, CUPS will set argv[0] to the
> Device URI.  smbspool_argv_wrapper can be used in testing to emulate
> CUPS-like behavior by setting argv[0] to the device URI before
> exec()ing smbspool.
> 
> Signed-off-by: Bryan Mason <bmason@redhat.com>
> ---
>  source3/script/tests/smbspool_argv_wrapper.c | 68 ++++++++++++++++++++
>  source3/wscript_build                        |  4 ++
>  2 files changed, 72 insertions(+)
>  create mode 100644 source3/script/tests/smbspool_argv_wrapper.c
> 
> diff --git a/source3/script/tests/smbspool_argv_wrapper.c
> b/source3/script/tests/smbspool_argv_wrapper.c
> new file mode 100644
> index 00000000000..f4a1d0c762b
> --- /dev/null
> +++ b/source3/script/tests/smbspool_argv_wrapper.c
> @@ -0,0 +1,68 @@
> +/*
> +   Wrapper for smbspool to test Device URI in argv[0]
> +
> +   Copyright (C) Bryan Mason 2019
> +
> +   This program is free software; you can redistribute it and/or
> modify
> +   it under the terms of the GNU General Public License as published
> by
> +   the Free Software Foundation; either version 3 of the License, or
> +   (at your option) any later version.
> +
> +   This program is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +   GNU General Public License for more details.
> +
> +   You should have received a copy of the GNU General Public License
> +   along with this program.  If not, see <
> http://www.gnu.org/licenses/>;;;.
> +*/
> +
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +
> +/*
> + * Before calling a backend like smbspool, CUPS will set argv[0] to
> + * the Device URI.  This program wraps a program like smbspool and
> + * sets argv[0] to the device URI before exec()ing the acutal backend
> + * program.
> + */
> +
> +int
> +main(int argc,
> +     char *argv[],
> +     char *envp[])
> +{
> +	char **new_argv;
> +	char *exec_path;
> +	int a;
> +/*
> + * Expected parameters:
> + *
> + * smbspool_argv_wrapper smbspool uri job user title copies opts
> file(s)
> + * argv[0]	       1	2   3   4    5     6      7    8
> + *
> + */
> +	/* Allocate memory for the new arguments (exit on failure). */
> +	new_argv = calloc(argc, sizeof(char *));
> +	if (new_argv == 0) {
> +		exit(ENOMEM);
> +	}
> +
> +	/* Save the path to the smbspool executable */
> +	exec_path = argv[1];
> +
> +	/*
> +	 * Shift the rest of the args so smbspool is called with:
> +	 *
> +	 * uri     job user title copies opts file(s)
> +	 * argv[0] 1   2    3     4      5    6
> +	 */
> +
> +	for ( a = 2; a < argc-1; a++ ) {
> +		new_argv[a-2] = argv[a];
> +	}
> +
> +	/* Execute smbspool with new arguments */
> +	execve(exec_path, new_argv, envp);
> +}
> diff --git a/source3/wscript_build b/source3/wscript_build
> index 6707b4bb146..fb58b85b4db 100644
> --- a/source3/wscript_build
> +++ b/source3/wscript_build
> @@ -1144,6 +1144,10 @@ bld.SAMBA3_BINARY('smbspool_krb5_wrapper',
>                   install_path='${LIBEXECDIR}/samba',
>                   enabled=bld.CONFIG_SET('HAVE_CUPS'))
>  
> +bld.SAMBA3_BINARY('smbspool_argv_wrapper',
> +		  source='script/tests/smbspool_argv_wrapper.c',
> +		  install=False)
> +
>  bld.SAMBA3_BINARY('locktest2',
>                   source='torture/locktest2.c',
>                   deps='''
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





