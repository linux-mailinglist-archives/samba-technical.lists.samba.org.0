Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDD6CAEF5
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 21:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=aR8M4s+ss4suysJw7+QxNKuz/usf11vzOhKLzY7AMg8=; b=oEBqNGdV5G8s7FuT43QHoAKphi
	T5jF8b8BQRAYCRwRWQGZ395tMLW0k3PrSJ9iD40iCrab0VOuGPq/2LQi9Zpx5epyKiXTmheN8QtO7
	xkpEiByX7+ZNDp1Q375kwdwmMHe6OOXD7ZrXfO2E6PRbBGzbLezKB36ArCVjBAivnZQ1sazjWlNJb
	rtQlM+ftoueP4ECBTrh3I8K+bQFQphIh+7S3JCKhymOw6Xcn4O5rmOI4mgHgZ6ExpeExgPgFdYJIz
	6+TrpB/bRH1yWNpJAensRhq9Av8nuEIbV/jFKSzVpwUxXZ4vu75ly0Vm2VSZauRJspzuErgLGnhQs
	dvsDnU2w==;
Received: from ip6-localhost ([::1]:38764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgsfu-004qK5-LF; Mon, 27 Mar 2023 19:38:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37758) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgsfq-004qJw-1W
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 19:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=aR8M4s+ss4suysJw7+QxNKuz/usf11vzOhKLzY7AMg8=; b=uyfwV9dvnkfxGgFsOYCqtFOvfC
 Fj9vD6VVi9b9dBomojMJtfbnPDY3Tyd02KSxhlUoFRSxCoVVHSI96YYHIdlkB4SSWyHuk0U1PmCpT
 4ragtoshzjUdce9+926Eaf7TESYr0IuffFMv13c3NPD60I+hk/C6vGDYghwF3JToiUpCudUCM1VJ2
 5pVSV1V3fhzcv4OrBRZ33FlgEEVE2SyROQWBLOkcvwsnVzOe7SKHoPj4hoKjjGFPqk3/qjL3YsSmX
 UF4Qr6nZSj5uL2s0BcsI7d71viC1SmrK+slclq16mVis3f42d31f9QPYYWLxAzoGDuQvnKTudAYUv
 4E3yoeFaOxyTYgwU7t/5KcLbbclyPadE7CLLh0xjgxEtB1QhA+qwwT9mU7RxZJTqxJu4/VOl1pK8s
 JgkfM7rT1/lh3jwJtLWsX9BLI5eOR1hYiUz2H+lv7r0ToC9vj8AtkyTZBHr0Gi7bJEzuSTFAgOL8O
 iQafGy3zluxuSRO6j/UrQ/QT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgsfo-005hnR-Io; Mon, 27 Mar 2023 19:38:32 +0000
Message-ID: <7b120b4e-b796-e24b-a463-2e5246dc19c2@samba.org>
Date: Mon, 27 Mar 2023 21:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
Content-Language: en-US
Subject: Re: Joining a Windows DC to a Samba AD Domain
In-Reply-To: <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
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
From: =?utf-8?q?Bj=C3=B6rn_Jacke_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 27.03.23 20:54, Andrew Bartlett wrote:
> It is meant to work, it just isn't typical.  Often used for migrations out.

I would say it works sufficiently for migration purposes, sure, but not 
for generic usage. Things that we still don't implement like adminCount 
(bug 13954) and probably some other small puzzle pieces will make people 
unhappy who will try to use Windows and Samba DCs side by side in 
production.

Just my 2¢ ...
Björn

