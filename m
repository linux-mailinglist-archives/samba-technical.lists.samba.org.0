Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B914FB319
	for <lists+samba-technical@lfdr.de>; Mon, 11 Apr 2022 06:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vJR84yCYZifCmgdbD6UKApA6Ko6jy383HlYHrYL4WBA=; b=qXSN+tR+DzCxsR5/Fze8J3ZS6y
	3+vxP1fyYNaepASdIVTwuoxUuQFpbV7hkkqCwhCxMvF4umexaTGdc2/5Cky77LfzC2OH8gJMA9PEU
	CR+uGiwpqsM6Q4//OCHAXwBpR2PnqS3xuSQ4vsDqywgTobLX5rP1qCChurfpXLyOUWMgDN5PsoqOF
	zJ6n09jwl5VJlo/GNj+uDLsvmtEP+Oa07oDjHhssONYrf1ZaE2jqJ06UCRrlMoub0deAKzYhTHbqw
	GsNkAm8u9QMkNQv6WyXJzA7gVhjbFUF5QJEKVm9MfEYTwjKj0yt2p+E+Q0x1WByYMNQy/IGeYPuS4
	HeMF06HA==;
Received: from ip6-localhost ([::1]:41838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ndm1x-00BO5p-1F; Mon, 11 Apr 2022 04:52:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ndm1s-00BO5f-H6
 for samba-technical@lists.samba.org; Mon, 11 Apr 2022 04:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=vJR84yCYZifCmgdbD6UKApA6Ko6jy383HlYHrYL4WBA=; b=2GlM9Pi+Pjr5yd5KIFj0WCMBrY
 MjT1zR6QsZEL5sK3JTKZWeUSex1Pvcd8K3aH5OvYVV6kLDHXeuemPJaFRjBApkHTib6oAR8LzobNk
 aXtPUAEvnYSRSYROajVSx3u9IT+x2FGZpkgSttRnrYCaSnbbMfTWJeouWelpZLYgc1ZvDUPWVMI1T
 33JHWsQMOAG/1KhfHf3qZBLoh1A+nxucwM1uutS1645rtduqZ3f9j97YArsMBzpGi7jtJe++lyuW/
 fEtfW9A7pKgdoan76IYIyQ0wuARDI4TesEGEzahmA7GIlzUOW4A9nbI1mQcc4zmDnyp4ArmminhQ/
 dm8JOOq7Hy8ZWGkjww5k5d8PIGNTw9zHc5Yvj3rzj4+ZS+giVNa7W2vOlbbanwm9Kq76GwzHACyY2
 R3WCXFB4Bw0YR40kQun9fh+/FzHalF8i/0IsHMVUkU2h29ArXW8WMvOUHFMUE8PI7bhDrl2EuHwQS
 TvL7hlw9NY9zk4jpMPhqjCEj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ndm1q-006M9w-4r; Mon, 11 Apr 2022 04:51:55 +0000
Message-ID: <23df11d3ea437a4e13a935798fc1c71b922b249f.camel@samba.org>
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 11 Apr 2022 16:51:50 +1200
In-Reply-To: <7159d706-8e71-3d3e-9eca-979ebd117eb3@msgid.tls.msk.ru>
References: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
 <7159d706-8e71-3d3e-9eca-979ebd117eb3@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2022-04-09 at 09:55 +0300, Michael Tokarev via samba-technical
wrote:
> Just adding 3 comments to clarify (it is -ENOCOFFEE time).
> 
> 1. I do set PYTHONHASHSEED=1 now everywhere, including this failing
> arch
> 
> 2. complete build logs are available at
>   https://buildd.debian.org/status/package.php?p=samba . There, the
> sparc64
>   build failing (Click on the "Build-Attempted" link) exactly due to
> this
>   issue.
> 
> 3. the "good" version is taken from amd64 build of the same file.

Thanks Michael,

I've always suspected that fixing PYTHONHASHSEED to 1 was only part of
the fix here, and that we really should not be relying on that
entirely.  However getting things close to upstream was always the
first step needed.

I think what we have were is the war of the build systems, brought up
in 2022 because we now import the whole Heimdal tree, not just some of
it.  

I've checked, and in the past the file didn't exist, it came in as
lib/gssapi/gssapi.h in 40b65c840e03bd5eb7f3b02fe80144650c63c005

Likewise it seems the stragely named lib/gssapi/gssapi/gssapi.h was
added upstream by:

ommit b65ef282f1ad2a33114ea86a109895742623cf2b
Author: Love Hörnquist Åstrand <lha@kth.se>
Date:   Sat Oct 7 22:06:25 2006 +0000

    x
    
    
    git-svn-id: svn://svn.h5l.se/heimdal/trunk/heimdal@18333 ec53bebd-
3082-4978-b11e-865c3cabbd6b

diff --git a/lib/gssapi/ChangeLog b/lib/gssapi/ChangeLog
index e348f10a95..47f3696cee 100644
--- a/lib/gssapi/ChangeLog
+++ b/lib/gssapi/ChangeLog
@@ -1,5 +1,12 @@
 2006-10-07  Love H<F6>rnquist <C5>strand  <lha@it.su.se>
 
+       * gssapi.h: Add file inclusion protection.
+
+       * gssapi/gssapi.h: Correct header file inclusion protection.
+
+       * gssapi/gssapi.h: Move the gssapi.h from lib/gssapi/ to
+       lib/gssapi/gssapi/ to please automake.
+       
        * spnego/spnego_locl.h: Maybe include <sys/types.h>.
 
        * mech/mech_locl.h: Include <roken.h>.


So the (time expensive) fix could be to work out how to remove the
'tripple gssapi' upstream, finding out if automake still requires this.

Otherwise, we need to find a way to depend on the .c files in
lib/gssapi but not the .h files or perhaps it might be as simple as
adding a empty subsystem to get the include path of lib/gssapi/gssapi/.

Either way, I agree there is a real bug here, we just need to stop
papering it over.

As always, I'm glad to provide more advice and review,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


