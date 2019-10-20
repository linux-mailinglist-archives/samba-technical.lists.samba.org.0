Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960CDDD1F
	for <lists+samba-technical@lfdr.de>; Sun, 20 Oct 2019 08:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EWL+aO/XcG8K7kiHNjByz2orFbWwvBixTpObXEKO4vA=; b=kx2VN/7X3Z9wD/PUqh4B1Eky4v
	oMESCPrHmsuh7G1nIfVJIwDyHi/7sJySLe5qd6qVpNBenKf2olSbBxofXDXRVN0IjpVJxXiN1Ox83
	/Z8pPHtPkejdGzmoUwhpkLWLZoTm99Pf1EpK4ygg2tjKHCS5hVSztOeYLEnhzPOYcpM035GV/XQIj
	nHVYJobJhc9FUG3cq5vWQZrhaRN7UfTO2FCPzR/akVwOLlWKoNPTDa+gcmj/fApMUhAhTFLQRQ1VZ
	B9Ye8Bv93m29T5TaBj/agRo9gAVj5OBhld8ai5MCOnLIKc1Xr6AAEtXtNHFGiY2jPZfBc0QRuWlt+
	UvJeB8Rg==;
Received: from localhost ([::1]:55588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iM59F-000mP9-7S; Sun, 20 Oct 2019 06:57:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63344) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM598-000mP2-Gb
 for samba-technical@lists.samba.org; Sun, 20 Oct 2019 06:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=EWL+aO/XcG8K7kiHNjByz2orFbWwvBixTpObXEKO4vA=; b=UanliY5wMcGLB3bN+QdHzLeHnZ
 LrJh4W1Ygs1Qdpp8iXNl7PDep0XHcHczxBcPw+F3FO72OVwf9Q5fG0PIRvLYNG+SYau9qzkO5BjGW
 i0F8jG2Ao9hqDxMgI273vIa5/rpc3AdAcnG1kzLcLxFn8lphabmAvzBt+2VhI5ynO4hK5lPZPet0P
 UHQK/j2TIXXeIy4c8iguTPYSECRDSa/G8vks3CybjHgvEl5D8Dgm9Nd9GB+dP8jUrv98y6XL/Ygf5
 6YUvcJtB8aLEhGL7t+RKEWKfSWQ9L6XTn17sgiTf2gixuMV+7m3n9WDbScP4m35Q8NyuOFlqcKFXQ
 pAhbtwAqSNl1ORs8R8ekV7XeRhvgz4Sgo4O4hzvkQVGdK1sN/HPipCSZpbkeCfkfwGHLpIfndxf1w
 T1ygOgtg7MyqakoJewI5YULVLfWuJ3FcrBIaXHImZsTo0ijdqCuygRemiDMJ59lpECEwhR78K19Lo
 ZGyYqhnZr587Kmb90AeLb3gF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM596-0007KF-Mn; Sun, 20 Oct 2019 06:56:57 +0000
Message-ID: <ab5a51e6f8b7b45e552c70db9a5ab517e328c4ae.camel@samba.org>
Subject: Re: [PATCH] build - use system asn1_compile to cross-compile
 Samba's bundled Heimdal
To: Uri Simchoni <uri@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sun, 20 Oct 2019 19:56:51 +1300
In-Reply-To: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
References: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: neil@nmacleod.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2019-10-20 at 09:37 +0300, Uri Simchoni wrote:
> Hi,
> 
> (Taking discussion from https://bugzilla.samba.org/show_bug.cgi?id=14164 
> to the list)
> 
> Attached is yet another cross-compilation fix which I submitted to 
> bugzilla for test by reporter before MR. The fix works for the reporter, 
>   but has been Nacked by Andrew, and I'd like to discuss this further here.
> 
> Background:
> - Heimdal build requires two tools, asn1_compile and compile_et, which 
> are binary programs.
> - In the native build of Samba with embedded Heimdal, we build them 
> first and use them to build the rest of Heimdal.
> - This fails on cross-build for obvious reasons.
> - One workaround (which I've been using when I was in the embedded Samba 
> business) is to build Samba natively, stash the binaries of asn1_compile 
> and compile_et somewhere, and set environment vars COMPILE_ET and 
> ASN1_COMPILE to point to these binaries.
> - A different workaround which is in common use (buildroot, OpenWRT, 
> LibreELEC to name just a few) is to *somehow* host-build compile_et and 
> asn1_compile and install them in the build's path, then run configure 
> with the flag --bundled-libraries='!asn1_compile,!compile_et'. This 
> would invoke a configuration test which finds the binaries in the path 
> and sets COMPILE_ET / ASN1_COMPILE accordingly. Let's call that "the 
> automatic method".
> - The "somehow" seems to mostly be building of stand-alone Heimdal 
> package. So Samba gets cross-built with asn1_compile that came from 
> stand-alone Heimdal, and compile_et which comes from either Heimdal or, 
> possibly, another package that produces this binary and has been 
> host-built such as e2fsprogs. Both might be overriden by what happens to 
> be installed on the build-host, if the distro doesn't take care to put 
> its built tools in the path before the system tools.
> - commit 8061983d4882f3ba3f12da71443b035d7b672eec broke the automatic 
> method, because it invokes the test to find binaries only if using 
> system Heimdal.
> 
> The attached patch fixes "the automatic method". Andrew Nacked it 
> because using some binary that we don't know where it came from is prone 
> to incompatibility issues. In fact, it appears that embedded vendors 
> routinely use a patch that removes inclusion of <unistd.h> from one of 
> Samba's libreplace files, just because of the automatic method, and this 
> patch works on 4.11 but breaks master. A better fix would be to get 
> Samba's build system to build asn1_compile and compile_et using the host 
> compiler.
> 
> After this long background, my response to the Nack:
> 
> 1. Does waf support this mixed-build method? Are there examples / 
> pointers? (I can try myself but any pointers would be welcome)
> 2. Shouldn't we "get things to the way they were" before supplying "the 
> perfect fix"? I fear of me running out of time and continuing this at a 
> much slower pace.
> 3. If we nack the fix, would it be correct to say that the current 
> situation, where "the automatic method" is invoked in system-heimdal 
> build makes no sense, as there's no need for asn1_compile / et_compile 
> with system Heimdal?

I think using that for cross-compiled file servers the system MIT
Kerberos should be the first preference, not our embedded Heimdal.

The second preference for cross-compiled operation should be a system
Heimdal.

Only if those are not possible, then we should cross-compile Samba's
internal Heimdal.  We should take the patch to fix waf to have cross-
compilation work in principle. 

Samba's waf is meant to be able to prepare host binaries using
use_hostcc=yes on the targets, but that may well have bit-rotted. 

The problem I have with the manual/automatic finding of the host
asn1compile and compile_et binaries is that clearly these are being
mixed up, and developers with little time but the best of intentions
are even hacking around that.  Samba is too complex to have things only
work with time and care, it should just work or not be available at
all.

I say clearly mixed up because:
 - The Heimdal 7.7.0 compile_et and Samba master are almost identical
 - identical compilers would produce identical output, regardless of
architecture. 
 - They would certainly not require different header files.
 - The complained-about output comes from MIT's old compile_et.

Substituting 'just a bit' of our Heimdal build is just asking for
trouble, in an already difficult area.

I understand you are running out of time, my suggestion is to lock in
what we can agree on for now until someone can either make a fool-proof 
fully automatic recipe, one way or the other.

Sorry,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



