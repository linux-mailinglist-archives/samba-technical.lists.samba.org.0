Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B69D95E3
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 11:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8rkym8L2sES8DkWQ3DvEVoeXz3NfNVVDK7wJoKQrXNY=; b=bcBJGZsqWwunWmfGWsk3CtPyxC
	95bIKrJ6tEaAg9cBHw78QhtMChiBecOLh0pjj3yx6pUkWGeL559yFrr2Osyuh6kjC4m1HT6F75tMY
	vDXPDyZH3r2/rQct5/UcoXhqbCdd3DT5556/I+xTUv5OZDb/zuKngsAShWNE7TLKv52R3ySHSlYuB
	E31YhOqG3UqqSHAbGmtOCiHYSCIM/H5RHSHiQqAouBP+0DUugaTJgyKeWuEHXj6PecX2v++kx19Rz
	ddBsqIXOINLOT8F0DNrz68af3rcVzZyh/N9jckMInEbm/EvFpAvv+WWBIiD9ry8lKCf86do4oyptR
	2wx2TP9w==;
Received: from ip6-localhost ([::1]:30628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFtG4-000rU5-36; Tue, 26 Nov 2024 10:57:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61786) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFtFz-000rTy-HC
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 10:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=8rkym8L2sES8DkWQ3DvEVoeXz3NfNVVDK7wJoKQrXNY=; b=t0ZQhaMQtTP+z5dcKJYF8RztgJ
 m6hL510Jpfu2jDcMbmqbQ8XppzC5+zAQ9A+MUOSLfVIjJvZdEVyckXud/YfCXHCKzgXoPIPHqR3Jc
 pPG96LT1eO2OktkFq5ZWQmmrla63kvxMiGzycsg6g1Td6ZXP3oSe8iGqfqTo0h+4QS/5XXzamu2p+
 KhrZKoHifX1guY940b0BobuPm3SvfdZupO+vW0kQOyXX/hqgbumHf2duMgyGZRuRWHgG7zJ4g9n0H
 /rVmwxxI6Mcnl+/KhKzUsPJgONPQc8wsddK7EQlBpN9XX2jWw8+ztD9r7B2EsHyzAC0kYK6S29oed
 5cGzG4qWzGrjVLm8kJTxT1Nor4/0XnTK2+s872/wsoE/G0T60OEEnJxm2wSMWt/XY/by0sD4UGmwH
 xCyYciNi7aR7EhBmtFMoJPZT9n3poiU91byxW2gWA0AQTI+SWaXbbJ4tw8mo7syo98oGPn2TNMMUK
 rrlHY/JLvcK15cX5/sy0alc5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFtFy-001WnR-3B for samba-technical@lists.samba.org;
 Tue, 26 Nov 2024 10:57:23 +0000
Message-ID: <d3b29e55-6ed8-4049-a2aa-9198735ac7a8@samba.org>
Date: Tue, 26 Nov 2024 11:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Status query: SMB Direct in Samba
To: samba-technical@lists.samba.org
References: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
Content-Language: en-US
In-Reply-To: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=C3=BCnther_Deschner?= <gd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Chris,

take a look at https://samba.plus/stf-project, there is a whole section 
on "Milestone Group 6: SMB direct" what AFAICT is the current roadmap 
for SMB Direct availability in Samba.

Hope that helps,
Guenther

On 25/11/2024 21:24, Christopher R. Hertel via samba-technical wrote:
> Hi, all.
> 
> I received an inquiry from a commercial vendor regarding SMB Direct in
> Samba, so I went digging through the most recent documentation just to see
> where things stand.
> 
> I know that Multichannel was moved from Experimental to Enabled-by-default
> back in 2021 (4.15 release), and that SMB Direct requires Multichannel.  I
> also found presentations from 2018 through 2020, all about implementation
> plans.  I didn't find a definitive "it works now" statement regarding SMB
> Direct, though I see that we detect/support RDMA in the interface code.
> 
> I poked through the wiki...
> 
> Do we have an authoritative statement about support for SMB Direct and how
> it is implemented?  If we do, please hit me with the clue-bat and point me
> in the right direction.  I'd like to write it up if it hasn't been done already.
> 
> Thanks!
> 
> Chris -)-----
> 


-- 
Günther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org

