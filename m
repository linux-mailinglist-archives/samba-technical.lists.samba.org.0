Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD349DEA18
	for <lists+samba-technical@lfdr.de>; Fri, 29 Nov 2024 17:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/LICCurPQpI4PPYsuaKWAFi2J7OjXDHQqNLWnkYUIqA=; b=WmplXFOB4aJJ4L66irG1v9L6YQ
	9QAJoyzH4cpQOF6QlhHL3CQgIg/6+uoMLrOsP0DfCQjzy+w2RzMx4c0uyFNcRE48zzu2V93IEAoC/
	Nq19L0lsP4ZL4pA7OjPdPcAGdXWXJe/d86DscXbf+PssGh7pkUxC5ZToII/7JF/vibZoI8pWoWrFr
	jfYBz9eprONsDCzMgx2HRrll9SaWQ51lpQEuoUFxeJLzfR5lJ9i4WTBoSOc6GzlPPxp9MgWySK8gQ
	tgAOZiX9B3kBrWcsbxhGPQgmIVz3E8hGCw9zdysMxhT7V4L2OjOZtDpDSK+d985Fi9+hrhn+PTH2S
	mu00pWgA==;
Received: from ip6-localhost ([::1]:43250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tH3RN-001AjB-42; Fri, 29 Nov 2024 16:01:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61130) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tH3RI-001Aj4-Fr
 for samba-technical@lists.samba.org; Fri, 29 Nov 2024 16:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=/LICCurPQpI4PPYsuaKWAFi2J7OjXDHQqNLWnkYUIqA=; b=IDEzUlXtu6AB3abbsB8tc9UzAl
 T8KQ/vx0ZJoBa8TxziF5AAwDK2Ff8OdcJvO+kESk3PFSgsbByPPRj5nnyUgPL3jCyabNjclzX7sKC
 UUoPDvXp2EHlb+rTIxx1BDy788uozyKpCDU03uDjna6NrpnPBQwhiPFQBTgVGAUTVTC5G73JydvU2
 JxzCXgargN1IA2tCU7sHT4dntMyUklV4Nt+Cq4aThbPwYnTWKwcJ9rJzTqGO/4MXjBwShPgPHTAMv
 0CsVuRIYbHS+IenlK/Tn+Z7lp/mGrN5ugfXsR5Z52ugtWjCX6q5inUR7IPRpiVkfzHUGcDjPWkpVR
 m8n8f5Am0bx8XdN9vW6mxhhjENFUUILw95Wc24lcAqSSimR7MwImmNAxk+Ixku3LWe4aenOUSwz3U
 /qh+6btkRatWyPFKkJfh03UF3SqMzMynlq56SZxRlPQYRJbasMiE8Y/Yr+WufOEpS872wITnI9SuY
 THFJThM0MvQDnAmOb1wpyiqS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tH3RG-00228U-2E; Fri, 29 Nov 2024 16:01:50 +0000
Message-ID: <68d390a5-8919-4fc1-84cd-7c10707ce25c@samba.org>
Date: Fri, 29 Nov 2024 17:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
 <7932bad1-8bc5-48e7-9561-60029d5a6056@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <7932bad1-8bc5-48e7-9561-60029d5a6056@samba.org>
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: vl@samba.org, Steve French <smfrench@gmail.com>,
 Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

coming back to this...

Remember, this talks about POSIX append behaviour.

I have drafted a spec and implemented it in the Samba server:

https://gitlab.com/samba-team/samba/-/merge_requests/3863

At some point I'd add the spec to out POSIX spec docs, given we agree on 
some design. :)

Thanks!
-slow

