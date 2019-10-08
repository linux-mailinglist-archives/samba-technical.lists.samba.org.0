Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390FCF56F
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 11:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3tV8spxQaLzzmWNNvXc/DLK9RiQTT/kXvBmgk0JOwSQ=; b=P6y/kU4+j1CmavNep+vUoHsA1c
	K+d5uMjQvXfnWbffPQ1zV04qw+hHWxjS9DkrJQ/jXbukI/Q/Cn9lpD5+d2Tlxlo6Wc7LIO+6giRke
	SnSYfpIwp4FS/AviAvwDuZb2auI3rq0rl6JdxBq5TCoKgpKX7lfu/tAClFgCCc6i/gSvlB5l2Knml
	xofDf3RS3++S7rfB+sR3l8BKConUMxxS2DHnaEVZPv+Nthsi11TAbbJDcLxdV6sCnCNBu5MrH4VOr
	ZVl2L/SoInkoOPlJndIxnhMr35C9eD/FmK+ZJfpWNuZgtBJakymdmQzhY3GsBzYWAL8AMcYFj4fD/
	D10lR6BA==;
Received: from localhost ([::1]:39736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHlLP-0022qg-Da; Tue, 08 Oct 2019 08:59:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63148) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHlLL-0022qZ-HT
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 08:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=3tV8spxQaLzzmWNNvXc/DLK9RiQTT/kXvBmgk0JOwSQ=; b=uPlCUg6DSsiwrDfut9mCV9eW8g
 LMi0WmZ30/7qSXMP8AAT3WuKSov6jU1IW5WQJdI+wTwB0XRHacHxE1aNLDvvRg5bj6ragqqYxsT9i
 4L9C9xIoKOicuPW1P7ASQ90AmWnwSpw8lTAiek+imoZrRVOIzUpPC2Cytw+b8kxgaV1Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHlLJ-0004j9-HL
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 08:59:41 +0000
To: samba-technical@lists.samba.org
Subject: Samba and legacy Windows support
Date: Tue, 08 Oct 2019 10:59:41 +0200
Message-ID: <5849953.E8HlOTvGIY@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba with version 4.11 currently still support a lot of systems which are 
already out of support. We still get bugs to either fix support for Windows 
NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is 
still deployed.

In order to remove support for those platforms which are very long EOL, we 
should try to make announcements when we plan to remove support.

## Steps planned

With Samba 4.12 we plan to disable SMB1 by default and then remove support for 
it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.

If we remove support for SMB1, we could also remove support for NTLMv1 and 
Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of 
these encryption types is blocked by the default system-wide policy and is not 
available through MIT Kerberos. DES support is fully removed from MIT Kerberos 
1.17.

NTMLv2 is still widely used and it uses RC4. This means we can't remove 
support for it till there is a valid replacement for the pure file server 
case.

## Questions

* Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/
smbdes.c`)?
* Can we remove DES and 3DES Kerberos support for Samba 4.12?
* When can we remove RC4 support with Kerberos?



	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



