Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15D217AFE
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jul 2020 00:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SMWcduyjNg5A8GQoDC/tPpWjX8hxq7G2e4YrlmoYw1c=; b=wsxp2Dcjao+bqZsXaEnbJ9ioNH
	oMvKR/odHkpCC8ULeaFWjutlKl9nBCyhvpIvhj9H6AzEEPS5xdmA8srYvbUpbr8+dL0lCj2kq+s1v
	V03BTVcdS/RE7lb+vSt89k1LXb5HTevwvZe+ZNf0Jp8h52vavBoU87FESS9Wqd+zQBlZKa/JgTi3M
	lrFjex4G6fh1eDHVMMchktuhd0zhxyGpUwzFYXAoWVFISRCEHAL2d1WkF4WRbzY57r56iKEQskJ0L
	G9Hgn6Oi4L2mMPW6eulOn3sSJHoJugf0ki07lmrtGDvT5Ri1dRZ6TCMkpuYpPA3yQ7/Xeb76CVLbO
	FFVe/fjg==;
Received: from localhost ([::1]:36222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsw5X-005zSP-5E; Tue, 07 Jul 2020 22:29:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28804) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsw5Q-005zSI-Dh
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 22:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=SMWcduyjNg5A8GQoDC/tPpWjX8hxq7G2e4YrlmoYw1c=; b=lxXPCx47x3dATvrzOTiZJn45Tt
 d+tu+eO6hv76Q3RNGz+yNtA1TITwYyrM6Lb5xMN7AI3sbmMIriGBCvoDzuFiXecc5VmuI/uGxosFa
 lWCjSvZ29NkavkK5YpHUrK8K6WdcLuvj0+1G9nzz9tDLN0hGA9RviGWAmesH9Nts4DP9NTKRxyo4m
 3EuK6Ubti4P55mDV2yx3FflMTxo9U8gWEfjp2zINfjyfbLRbb5oUBHeSV68QqZ6i2IzwhbIc7bw8f
 f2pGFya8uoDiGMu2ncLLFlmvW1Z0yl2GfmvICF1WLdfKw/vb8hZVgGKxP5FVztafTWzmvVcrnw/cr
 lELxDHcciRmYtmA8xy0PRi3xlxW9/KVvNq1UTXF2ux8kMDXUFdpz+faHb83Rs/wQ/Pzpw8r7J+nl2
 eRNaVE3wLcrjbepY9uPi0rKx5ksajYPOPTr9ZP9F875cW02k/blL0Kn1DAwVuDpQm2ZQ9uAwauBaG
 IDVG4Z90vFmCKh/lMauQ61Y4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsw5P-0008QB-KI; Tue, 07 Jul 2020 22:29:11 +0000
Subject: Re: What is the difference between a 64-bit fileid and a 128-bit
 fileid in Windows?
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPwXQe5xPrtzYRNTsfjA0e_P2WBGoAuiKpFypxXtoZg=_A@mail.gmail.com>
Message-ID: <d3c720e1-7016-7e38-8d7d-1365ffaff027@samba.org>
Date: Tue, 7 Jul 2020 17:29:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACyXjPwXQe5xPrtzYRNTsfjA0e_P2WBGoAuiKpFypxXtoZg=_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: "Christopher R. Hertel via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher R. Hertel" <crh@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Richard,

The actual on-volume FileID, as used by NTFS and/or ReFS, is beyond my know-how.

If you are asking about the SMB2 FileId (the one returned and maintained by
the server), then see: [MS-SMB2; 2.2.14.1]

That section explains that the 128-bit FileId (as used in SMB2/3) is made up
of two 64-bit subfields:
* Persistent
* Volatile

As you probably know, the Persistent portion is maintained over (successful)
reconnects.  The Volatile portion can change.

I don't know if/how these are mapped to the on-disk FileIds that Windows
uses internally.

Chris -)-----


On 7/7/20 3:32 PM, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I have just become aware that Windows has both a 64-bit fileid and a
> 128-bit fileid.
> 
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/2d3333fe-fc98-4a6f-98a2-4bb805aff407
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/98860416-1caf-4c80-a9ab-8d61e1ccf5a5
> 
> Are they always equal if the fileid fits in 64 bits or are they different?
> 

