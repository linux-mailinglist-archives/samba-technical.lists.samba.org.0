Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CDE18CB8F
	for <lists+samba-technical@lfdr.de>; Fri, 20 Mar 2020 11:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cD+gylyTYGIVe22SBfJmVOqkb5o2yRFtV3zOzWdSiqI=; b=HLR74K1cRoSVbdJw3Ze3ZKnses
	6ZxpSZAF57/K4aIaJFWWFXTuKhy5f9Wf8hUgaRkXqiKjmmuNG/HR4ELCuNpuVeiif6vzICs1BbQFk
	xGvbKz+92u4y3lwZbV/98q+bt4w5lIEULy1rnoQiI7CbUOCrQbBy7dQ3cgcCNrZ2OJIb0nIJn6M3c
	BtAcQvERd9AGLLiuYq/dFRAentQu2Gf2DgCQQmv/PV0UKG9sgdM5siaMu978foheLxNV1lQ4OIzqg
	3kobHYwOBYQQbjDEkniw6WAJEmo/QnpFT/XS9A+pPickxlKHkQY92J3BVHJ7dX2Mxxq0ZNabzwJv8
	E+o5mLTg==;
Received: from localhost ([::1]:40950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFEr8-000H6G-FH; Fri, 20 Mar 2020 10:26:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFEr4-000H69-9f
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 10:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=cD+gylyTYGIVe22SBfJmVOqkb5o2yRFtV3zOzWdSiqI=; b=Zv9DN3HW+ImTSUkJk5Vv13j2AG
 V/DMBDtyOWmO5NSw8WxQPTycCl6LJnD7IlXsBO0SryaTy6CY9uvgyI5Zr8019LL0MvY2s5kQ8PYgi
 hnf/foAoK8txxNEXMalS+OPFZ6ub8qFpcJbxkdQ3kehkQWxhuNvEpea671JGW7PiRjc46vvFq98XQ
 lYwIIAeqz8tTTbMOlvHXVYpic/cFByLqa8AhQ2Ut7FVCqm5ki4WR0Tfkv/feUe1Oi90A0vbKFOLme
 Fj1aO9+9QmR/ilTr7UIUDXxqnt1xv2K2e0lkAtvgQpkR1LrxLzdoYuI32Nf7VcrQoRYuqZHGd/SWl
 1ZGJaiWD3rlfCvdiKetACUJj4M/vDcb6kYS4s1AW8ofKK8qWiT3I1JA0UVAIVVttNGCmj0V4Xm+/E
 q5p97BkyqmVeG4mG7R8i1cuPowPBI6sGpD3pTqj/O1v7QeCwYCa6pPUd6bF8thAML6tzIFKKNepIz
 UfHVssmD8FJN9VkJ2+CVkusn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFEr3-0006Lt-SZ; Fri, 20 Mar 2020 10:26:18 +0000
Subject: Re: [Release Planning 4.10] Last 4.10 bugfix release
To: Martin Schwenke <martin@meltin.net>
References: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
 <20200320205512.651c6196@martins.ozlabs.org>
Organization: Samba Team
Message-ID: <627df2fe-dfcb-68a6-9c1e-3bd1affc62be@samba.org>
Date: Fri, 20 Mar 2020 11:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200320205512.651c6196@martins.ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Martin,

Am 20.03.20 um 10:55 schrieb Martin Schwenke:
> Hi Karolin,
> 
> On Fri, 20 Mar 2020 09:07:54 +0100, Karolin Seeger via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
>> for your convenience, there will be a last 4.10.14 bugfix release on
>> Thursday, March 26 2020.
>>
>> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
>> has been updated accordingly.
>>
>> If there are any important fixes that should go in, please let me know asap.
> 
> I think that this is a very good candidate:
> 
>   https://bugzilla.samba.org/show_bug.cgi?id=14295
> 
> Strangely, the v4-11 patch won't apply with "git am".  However, if I
> cherry-pick the very same commits from v4-11, it works fine.  That is,
> the following works:
> 
> $ git cherry-pick 46e19f9f402..783335f207d
> 
> Want me to attach a patch for v4-10?

yes, please. :-)

Thanks!

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

