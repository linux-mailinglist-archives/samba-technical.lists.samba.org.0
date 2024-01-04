Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC759824412
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jan 2024 15:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=31XEj4cNOa0Sn9sUsDxqgi1UmV/eX7WyFWY2Io4hrL8=; b=C0YNrY8wgYJvTRNXiknfhdXW57
	K0GnMULsQp+sUrf9VYENZkNJWitHt888EyLPnYFwVC5zxnopbae8wKp5TsKOU0vk7G+plYnh+miv6
	9a4ex19gaQtVCDieEyoKcdLVW5B8hVEg4ZuDk61rerXeWGcu/S1AYUGq4BZqzbKRU1/nuOcgGEw6g
	Ej1loZhz7QhDbqV1T1u4/NWIg48qwnc4MSsuSXXyy9m1LYeAiaeHnQwxCGGWvelc9GEMJCEvSA4mm
	PyLkO2u5TiP7V6/QuBaRtnkX1FqkzWObzQAmI4Uy2l0hBmFHuLAV46MP2/vYK+jdsVCF+srxW/rCs
	bDC+qarQ==;
Received: from ip6-localhost ([::1]:29120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLOzI-002NfV-GO; Thu, 04 Jan 2024 14:46:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47158) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLOzD-002NfO-I9
 for samba-technical@lists.samba.org; Thu, 04 Jan 2024 14:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=31XEj4cNOa0Sn9sUsDxqgi1UmV/eX7WyFWY2Io4hrL8=; b=ozeM2aczXG4DT/iluqbU1ekwV3
 0oopq3FP4t+ETrWXZPSM9+bQFR23Ry551mw/6bzRTxZZpF7CSmF7ADcoDZot4sl6QeMWE2HzfrzlB
 JnpMCH9EOtHqMOuwppDFhsQJXbCZ1pJyjGoHxtkBMJE/gPzE1nKNGUrtteVo7luCODkPGbDxVMS9e
 wHuu39BDGAprgH6t3p1ULFKQEv0sNuYBOEQMHyYssPMV/Z2W9XyXYunkIVcXUhTuQLj54lM9DGsAK
 YO5AUL3++yIN0AfNgywLb2q4b6AGfj3SO5KBpIe6yDgkMR+bTnQSFlglYIgZVumxnUn6vXK+sEa5r
 SN1WHcvHPcPCMYMliSzYRWifeh7YwTpPJkMPU7Bm7WLbdx+xFHlyFCdegaIzdWojBC0dTcr/GZc5y
 WAxFfARBxhF9zFresLAbylPnDQMSjs7NICPVALR+Hw7WPjO5bOxMUFz9w9IpZMcPeWSXzSZZWRLCc
 zJmTC2hJ8tDDir6onxNiH324;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLOzB-006Rmj-1O for samba-technical@lists.samba.org;
 Thu, 04 Jan 2024 14:46:17 +0000
Message-ID: <3e13bfd4-a763-a87e-2f36-36beeec957d7@samba.org>
Date: Thu, 4 Jan 2024 07:46:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Group Policy Ordering
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
 <ddf5ae2e-0bb0-825e-5dde-67003aa419bc@samba.org>
 <cbff5f90-ddd0-4f9d-968c-b4a1344fd81a@app.fastmail.com>
In-Reply-To: <cbff5f90-ddd0-4f9d-968c-b4a1344fd81a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 12/27/23 6:03 PM, Joe Dillon via samba-technical wrote:
> I'm at 4.19.3.  I'm missing any commits between its release and today.  Would the changes be in those commits?  From my testing, which is using a policy extension that just prints the contents of the changed_gpo_list, it appears a GPO that changes enforcement status isn't being passed in.
The majority of the changes happened in commit 
a8bad5d5b859a2a76ce18919fbe2bf42f8ef7562, but there were some minor 
fixes following that one. This patch appears to have landed in 4.19.3. 
So there is either a bug in the new get_gpo code, or in the CSEs 
processing of the state. If I were to guess, I'd bet it's in the CSE.
>  From my read of the certificate client extension, it appears this tdb contains a custom json representation of the client extension's state.  So, in essence, an extension must parse the pol file, read the current tdb settings, merge them with changed/deleted GPO settings, persist them to the tdb, then apply the settings to the local system (in whatever way the current GPO extension does so)
Correct.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


