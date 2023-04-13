Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B36E05E1
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 06:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Y9bzCTKI8jTFGWHWFDk6xheGlDipNLSQ5F4AG47TzZw=; b=b7pg77TUzt6mHHHy6D8t6tpYdq
	umF4ZMTYemkSboyNOphGNdZBQv/ZOAhdwZfd1mgm602D5mFGsNKPnVIIEePI/mfNCc0SG3zVk4UQi
	KRX4RvgfeUeRad0ciDox/10m7V16N78OYaeOBMG2URRy6BNE9ihq8Hav68Jh8WDMCTK1CW+8dWxMo
	ftgJA36TSmwiXcs2eXoNOu2qMsSKVDOtEdnu3eCLOBA61O7v0orN+Ach2Ru1fk/aq2vXq2tNjeOYI
	TJHuOCBgJWdQ6ZsKD9K6pe5v/FOhZs5HblyhLFf6SPDiB3pDGCOgW8O/GALPOBVuFE9n1hdWefklK
	biX9ZZhA==;
Received: from ip6-localhost ([::1]:23012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmoQ2-000xeA-To; Thu, 13 Apr 2023 04:18:46 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:38878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmoPx-000xe0-AY
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 04:18:44 +0000
Received: from [IPV6:2404:130:0:1000:eea:c63c:7e3d:3da9] (unknown
 [IPv6:2404:130:0:1000:eea:c63c:7e3d:3da9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 408DB81C9E; 
 Thu, 13 Apr 2023 16:18:18 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1681359498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9bzCTKI8jTFGWHWFDk6xheGlDipNLSQ5F4AG47TzZw=;
 b=WNj0I69sfVK6kH4ZU0OFOqIT6Ho45NxSS/8gLAGAPLVsDzCcM4I7BRYM8K5J6BFgJDc6FA
 XVrCn0SiCRAJEmQ1j3e3g8SoXztg1UNOOyYgfK2nby29+iKMamxMelQChbpr49XndusXTD
 FqmElEWe4IezVe8OIfpgyGxhDiC2nmwfD7fUpAmZoVmS3tcf3JWpyrwBurzht0bp7mh4F3
 Q2FoZN66CRr9N8rnflEHX1nt21NavXEGpOSHJciBU3oCoEa6L9GJCiqpe9X6sw6AefwkpI
 +KaTDpbEnuEbYAwXRA+OZJC1CMIft3R7XE4nPRhMzGmyGuz1ReohWO7Sfp3Lvg==
Message-ID: <8c78e366-5b95-f407-3ca2-2dc561b1d2f2@catalyst.net.nz>
Date: Thu, 13 Apr 2023 16:18:16 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Content-Language: en-GB
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2142927.irdbgypaU6@magrathea>
In-Reply-To: <2142927.irdbgypaU6@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
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

On 13/04/23 05:35, Andreas Schneider via samba-technical wrote:
> Hi,
> 
> there are strange things going on with the ad_dc_ntvfs environment. You can
> see it very well with the samba.tests.samba_tool.user.ad_dc_ntvfs test now.
> 
> I've created a patch that samba-tool consistently uses LDAP and not a mix it
> with local operations.
> 
> This fixed a lot of issues. However there is a test called `test_setpassword`
> which calls 'samba-tool user syncpassword' which can't use LDAP. So I've
> passed it the configuration. However this test fails now, see attached log.
> 
> Is it possible that the samba process restarted and works on different
> databases now?
> Any other ideas?

No.

Is this with a full make test, like you were doing in February? I can 
have a go at that overnight on Ubuntu 22.04.

First I'll try `make test TESTS=ntvfs`, just in case that works.

Douglas


