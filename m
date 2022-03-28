Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE174E8FB6
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 10:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qqjpKDQjCRcLGLzs87DCs5EBowtCmIFjC6cDUcjA+3o=; b=iuXGHxMbEAcEfmD8yfp4PMjU/g
	ltobhBifMwqwJE9yZ9twWc0n8gdSOujrfkxsprCQQ6P+kj9HMUp9iwsVzOYzPBwzL3NI7zzNXc/uO
	mPGEtgUMEkZsGNteoBR7x3oLJZk0Fzl2vvqFO+cWRzqFjHhX72J0XetI4Gb6wyuv+r8dgZYA/w7MO
	k6ofka5CYEzTabRSQIOd4gRJ/FXjeGMdBa+P4qCg0MCWnbhbEgQyvlUuj/iJhSqSb3csWPA1gRtE5
	JGK9nDhbHBy9rOM1Vb1ZTza3fvgd1b4AyECTDq77Q1m6eN8Eqi+K4bShlk4gpK59FGaV0CHrog1Oh
	BENqKfpA==;
Received: from ip6-localhost ([::1]:36646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYkMi-005tGh-Ek; Mon, 28 Mar 2022 08:04:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYkMd-005tGY-Pf
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 08:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=qqjpKDQjCRcLGLzs87DCs5EBowtCmIFjC6cDUcjA+3o=; b=V8F7iTfPy9OIpJbTjWccl0H8+w
 KeAZTlxZBtiWlxIFkyYebIqsjEK0/+ksYueInI6OdLti+4RC68UHggkIhn50d1qm7rgUTOvcDdqJA
 45NFRkgPIGiVP/NKnzOyznliIs1Y2yGHVI1PYaQ77PwRwCwa4SV2vc87D2XqfQzSnT43N/XymTMvR
 CJH8CdxrWRgDJBFD8BNNyIrd99LeUtCTnKqDmpeiJYW7PN1unRpDrkpeDPCmjm7MYRibBJR6AerB0
 iEorrHA0Umu5HrMEypeJm1rvJgWTCafc4NirLtaHiZfxlkoFH29V1HcTlHQFcaBf1pOrXFWqrIQKw
 0QuDgrJs6Ygqdwchz9uWuyDZbEAkNDBKqVUoZOQ3rilG+JggMsVECp57oRuj0BmmTjZxdmZVODDkm
 2aP0rndzlU9qyk0xlg2D3hsqFCSfC/jg3YueGdWkJGXkhuv05ImEmlyfjO2MxieYV2nO90HTHQQNJ
 /vSkWcONBvV7DnjUQ4rjEUzq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYkMc-003x1F-Nn; Mon, 28 Mar 2022 08:04:34 +0000
Message-ID: <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
Date: Mon, 28 Mar 2022 10:04:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
In-Reply-To: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

are your using 'waf build' directly? This that I saw the same
problem in the past. Please use 'make' and 'make install',
the difference is that it passes PYTHONHASHSEED=1, without that
the order is random.

metze

Am 28.03.22 um 09:14 schrieb Michael Tokarev via samba-technical:
> In the other email, we wrote:
> 
>  >> First, the includes.  For example, while compiling
>  >> lib/krb5_wrap/gss_samba.c ,
>  >> the include-path includes -Ithird_party/heimdal/lib
>  >> -Ithird_party/heimdal/lib/gssapi .
>  >>
>  >> gss_samba.c #includes gss_samba.h which includes
>  >> lib/replace/system/gssapi.h,
>  >> which - based on HAVE_GSSAPI_GSSAPI_H, includes
>  >> <gssapi/gssapi.h>.  The first
>  >> include path which has gssapi/gssapi.h is third_party/heimdal/lib,
>  >> so we include
>  >> third_party/heimdal/lib/gssapi/gssapi.h. But this is a simple
>  >> dispatcher file, it merely includes <gssapi/gssapi.h>.
>  >> Which, as we know already, is
>  >> third_party/heimdal/lib/gssapi/gssapi.h. So we end up
>  >>  without all the gssapi definitions altogether.
>  >> The correct file to include for <gssapi/gssapi.h>
>  >> is third_party/heimdal/lib/gssapi/gssapi/gssapi.h (note the double,
>  >> or even
>  >> triple, gssapi in there) - so the _second_ -I path should be used
>  >> from the
>  >> above.  This is quite messy and not really reliable.
>  >
>  > Again, like symbols, header include paths are dependent on the 'deps='
>  > of the subsystems.  So a subsystem is missing a dependency.  We have
>  > had reports (to Heimdal, frustratingly) about this, but someone needs
>  > to chase it down.
>  >
>  > See https://bugzilla.samba.org/show_bug.cgi?id=15033
> 
> Too bad I didn't know about this when chasing this issue here :)
> But it is good anyway to know there's someone else who hit it too ;)
> LOL :)
> 
> Okay.
> 
> The thing here is with include path ordering. And with timing issues,
> it seems.
> 
> I have logs from two consequtive builds, one of which failed (bad),
> and another succeeded (good) without any changes in between (the
> same source, the same packages installed from debian since I haven't
> run apt update, - everything is the same).
> 
> We should list heimdal_build/include *before* heimdal/include in
> all cases. Yet the order is random, non-deterministic:
> 
> --- good0    2022-03-28 09:59:07.502426113 +0300
> +++ bad0    2022-03-28 09:59:01.606521064 +0300
> @@ -2,0 +3 @@
> +-Ithird_party/heimdal/lib/krb5
> @@ -3,0 +5 @@
> +-Ithird_party/heimdal/include
> @@ -4,0 +7,2 @@
> +-Ithird_party/heimdal/lib/roken
> +-Ithird_party/heimdal_build/include
> @@ -7 +10,0 @@
> --Ithird_party/heimdal/lib/krb5
> @@ -9 +11,0 @@
> --Ithird_party/heimdal_build/include
> @@ -12,4 +14,2 @@
> --Ithird_party/heimdal/lib/roken
> --Ithird_party/heimdal/include
> --Ithird_party/heimdal/lib/hcrypto
> --Ithird_party/heimdal/lib
> +-Ithird_party/heimdal/lib/hcrypto/libtommath
> +-Ithird_party/heimdal/lib/wind
> @@ -20 +19,0 @@
> --Ithird_party/heimdal/lib/hcrypto/libtommath
> @@ -22 +21,2 @@
> --Ithird_party/heimdal/lib/hdb
> +-Ithird_party/heimdal/lib/hcrypto
> +-Ithird_party/heimdal/lib
> @@ -24 +24 @@
> --Ithird_party/heimdal/lib/wind
> +-Ithird_party/heimdal/lib/hdb
> 
> There, I took one command line (compiling source4/kdc/wdc-samba4.c),
> split it into separate lines, saved into two files, filtered
> everything related to heimdal, and diffed.  In the bad case,
> heimdal/include is moved before heimdal_build/include.
> And this break stuff for the reasons already mentioned above.
> 
> So we do have obvious ordering instability.
> 
> Besides this, we have one more very annoying issue. Namely, it
> looks like "next" waf steps always include all previous steps,
> complete or in parts.  In particular, `waf install' *always*
> rebuilds about 6k files even if nothing at all had changed
> in between. While `waf build' builds only about 4k files.
> 
> Why it is relevant in this context.
> 
> In debian, waf configure step is done with -j1, to avoid
> parallel/ordering issues.  However, waf build and waf install
> are done with default parallelism. But since `waf install'
> re-does some of `waf configure' steps, but this time with
> parallelism, this may lead to different results with the
> ordering as we see with heimdal includes.
> 
> So it looks like we have 2 or 3 separate issues here:
> the always-rebuild and install-builds-more-than-build,
> and include ordering depending on parallelism.
> 
> I'll try to figure out what's going on, but these things
> definitely require good understanding of waf internals
> and machinery.
> 
> The two build logs are available, just in case, at
> http://www.corpit.ru/mjt/tmp/samba-heimdal-include-ordering.tar.gz
> 
> Thanks,
> 
> /mjt
> 


