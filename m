Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81948910C16
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2024 18:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=QX7R7iPI0hxJ67N94BwqETbjGwx39R5d8LSLoGMEZ+o=; b=wexefFjEup8+3WkpabsI4Conok
	kWpc7TySJn5cvfOcZVKqk3vv/Xj/G7m1y/O0+XeZRUUQxsCBLNdS6XJNEd1aff8PTryIi9wwC2p9F
	OWROAo7W0o3xuYupHd5fXn0eC9cfGwl6G4NeqZzSvRCm0olCwjmxk9gDFMeOipxNKhLLekH6vSOxG
	m56c0xjj0boJMI8RtPSvCe6xegYwL7gOd0+lxUr7Wt853II4ENQPIt8EufRoGGm9esfGXqXVaM63T
	Ol/0gepGTWggzy9vkMHGrNrk3ehmYuv9tGRPulYOwCrqxgKwoH97woXJweI9SSZZnQrY8nWBNXaeM
	drjSLYAg==;
Received: from ip6-localhost ([::1]:28260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKKXI-00EjIk-7x; Thu, 20 Jun 2024 16:21:20 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:54871) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKKXE-00EjIT-80
 for samba-technical@lists.samba.org; Thu, 20 Jun 2024 16:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX7R7iPI0hxJ67N94BwqETbjGwx39R5d8LSLoGMEZ+o=; b=YD5JtOj40W3jH42Kp298q5C8FR
 Vr6f8vILS6Ga1/avJ5uy7dUP1Gha6isre1qxThklJTYMxmpDBFxhNx30ZP51HMO9o4t+ySjwklDP3
 EM5hc4jIBYxIvMAEiGCRh9ct3hvsvyARQKbBTvwGD8J7mtMUcIfsNhjLFl9HM9n7a3H1eJ7Bv/syp
 RjJG2IeRcfw6rwcUaRUmP9C/P9/3DPpv1wfrvMaHZ8usgi46FJ9EdLxcKB01qjnighReWge/jCDV+
 vfUOvnFVWHf2eAYvOTtTPljLZdRVVXMKHf5QkuHBlyhvlX/W5E/XJ4RNyZD/R4aNTOm0YARHR8P8U
 bwiB+iQQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX7R7iPI0hxJ67N94BwqETbjGwx39R5d8LSLoGMEZ+o=; b=UN6AbPpvpDYJUlbJWt5WBEIncD
 hA+xR+ByE/U1QZLjXEMUE60+czParqevhknldt8J6fzC8t5fzVaLxGh0VKAA==;
Message-ID: <3b516d34-24f3-427e-b857-76892840081f@sernet.de>
Date: Thu, 20 Jun 2024 18:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vendor version/revision string
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
Content-Language: de-DE
Organization: SerNet GmbH
In-Reply-To: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=C3=B6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

On 6/20/24 08:46, Michael Tokarev via samba-technical wrote:
> The prob is that --vendor-patch-revision expects just a number.  While 
> in debian,
> version string is a string with many words, - even the debian revision 
> "number"
> (everything after the upstream version) isn't a number but a string.

Same here. I also add the revision and information about the destination 
os to the version string, similar to:

# smbd -V
Version 4.19.7-SerNet-9debian12

Until now I achieve this by patching the SAMBA_VERSION_VENDOR_SUFFIX in 
the VERSION file at the beginning of the package build process.

Best regards,
Björn

