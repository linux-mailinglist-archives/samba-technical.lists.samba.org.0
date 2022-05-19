Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1C52D265
	for <lists+samba-technical@lfdr.de>; Thu, 19 May 2022 14:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6WKSMvqsRA2xsFoeAAnfkN1+53SKJ1OAsJj76gCn8wA=; b=UiXCg55Rz6Kz6Ph6a8bbR602oE
	pPsnOrVvkML3SSFshh6JChttfxxeF30jEx+izvuACkN0JwxLnlHHVEZtJunREpBvCRUh9beBybGoR
	fDFo4idA4VPKC6YBztYML8Dmvm1qwxh39KBiksG58baAP7sEmBH1H8RHPNWkm6F3UHNFzh/AiTDc8
	FajoCQosxn5V+AfJdvk030/RR4a/cvOlsXQw5T3M74VhzaixK7G7cnEYU8bFPPtvHk2YaUpcOPJqZ
	WLh/iz0jgCxBOHAO/uQ4Uw0e1sm4jFdUGqR6fvWUuLIvH2DzXVRFx2rkOi0jpFGrs+ZhB0xfqd62Z
	FQ8WHIbA==;
Received: from ip6-localhost ([::1]:47156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrfBm-0022Ps-QG; Thu, 19 May 2022 12:23:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrfBh-0022Pj-UJ
 for samba-technical@lists.samba.org; Thu, 19 May 2022 12:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6WKSMvqsRA2xsFoeAAnfkN1+53SKJ1OAsJj76gCn8wA=; b=rTdcD3m1I+5wLbf9nJDTWGLN1n
 dqZYdNBVubuKCukkK8bzdKJnSEbdb/l3FgVrkckr5QJ9NirpeFTaofv2RMiaHUw9mffLmzb064fkl
 J0wM/UrxcmyHhB1Wxs44aFhNBf3uuTOX6ACGWPLEpUB7Z7W4SFpVpyFgLj4B1TMX0G9gQsKEgzJYV
 cotbmw9eaJggE6TgjEvzJPPKAmd/F5alXSrVN/G850tMcbLUJwW0cexSO/PBIcUavSSCgW0TsXq58
 2lleOEPUOzPWNLrwB5FYzlSEmnDy2rxGw3yfDX0ZbnnxhnSOTyXPh2T7oXFIPPIU5HPJMr+pHhSwF
 v6AlDgct7M/FNdPK+4TGGUhOzClxLMPy6tqYfvkguiRUd1a0zn6ORYM36b7Zv2ZPmP8r+zpPPlX52
 L2CrTC+DaUbcrkN+844P1WWvj4tCQCcVOsIrNiixdv5ZRASisEUyn5Lcs8CkoRtU/gfz5Of6MMxlU
 2UAq4VFc0MW5JGKM+ShvXT7w;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrfBh-001dLu-FD; Thu, 19 May 2022 12:23:29 +0000
To: samba-technical@lists.samba.org
Subject: Re: tons of uselib_local warnings in waf
Date: Thu, 19 May 2022 14:23:28 +0200
Message-ID: <3519737.R56niFO833@magrathea>
In-Reply-To: <20220403045229.1824798-1-mjt@msgid.tls.msk.ru>
References: <20220403045229.1824798-1-mjt@msgid.tls.msk.ru>
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sunday, April 3, 2022 6:52:29 AM CEST Michael Tokarev via samba-technical 
wrote:
> I tried to dig there, but weren't able to figure out how
> it all works.  The following change does eliminate the
> warning, but I'm not sure the resulting thing actually
> does what it is supposed to do.  For one, there's no
> function like "apply_use()" in samba_waf18.py which does
> something similar to "apply_uselib_local()", - I don't
> see where this "use" attribute is processed.
> 
> What would be the right fix for this?
> 
> Also, where to look for some basic docs about waf
> internals?

Hi Michael,

I wonder if someone really does. You can look for docs at https://waf.io for 
waf documentation, but there isn't any documentation for wafsamba at all.

I would suggest to create a MR at gitlab, then we will see if anything breaks 
or not :-)

https://wiki.samba.org/index.php/Samba_on_GitLab

Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



