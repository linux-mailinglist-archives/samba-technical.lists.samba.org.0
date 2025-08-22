Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E380B31CF8
	for <lists+samba-technical@lfdr.de>; Fri, 22 Aug 2025 16:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kNVHzisemVBBr2vQLNuxWt9AkYYycK1//x/CvKuQ0zY=; b=OilvvwlboRq6CBAf9fbYn7zrcA
	BnUgER8HUIVc/OXGK6gzZSV1ltHG87WFeG19xRnaBmbWn6I8PAhWhH22PV3Y1+xeqK+fzskyjZr8v
	CRpUl1ic0+vFNcigJ7LODXcPe8ymgTBaczmuiCFIbiAO4q2jZ/IKKr/u5kKXLOXDd1vreM8GnnkCo
	+/rUrKi4MWgB3ZonYmnzcUyfFnxx+hvlSkfJP3teD4P+BHapL7fLq5rjxEVr8XaQaTF0c+chZbZhF
	EUYSwefjXcDF0G+y0cTbfcc+goMwK2iQ7zG9cj95RyVpiQLnLqaNfZfn09VZWn3BlnOGBtVexL0SU
	VnGwSIhg==;
Received: from ip6-localhost ([::1]:45610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1upTDI-0009Uv-9l; Fri, 22 Aug 2025 14:57:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59844) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upTDD-0009Uo-Vc
 for samba-technical@lists.samba.org; Fri, 22 Aug 2025 14:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=kNVHzisemVBBr2vQLNuxWt9AkYYycK1//x/CvKuQ0zY=; b=LT42/VSnob81WGDaPoYBplXbfJ
 fa1GqYzsU3u1XQxdCyHcIP0kAUdzSeTeZjM79qN6bhbEFqgojQsMUBo7pG++2D+buUJqWVAW7FwVD
 6fYIFr0cDYNJIpo7ciZjSAM2H+/3JHmdK8LtdKQfMYwdmCQvfXa9OC4ar2Bin2LwNhIzzAV3BTswH
 k5OHsAbQQAQlPTdTlAT76LIK3xTzBClR/FEll/D1wA1CVaHUy5B087hYLq9BqQUiyQ/kO0YT5BMcb
 R4ZBiq5RXVXVHVjKbf681C1HqNA3l/QBbHUUI4Qh6R7HmIj+1ngEG/hLwPJtZenmnYUe/rViSDnnA
 o+9PQ3c544ir0qA9CESrbRY4HV3RwPZ/c8xNKcMUtuqZ/h7VMr/K47n00gNEzronkRt5ZtV+RgJhh
 t9JNKqUEFDVI17rhaz668m+wLHEzvVFDCRIqMfEPAPrKzQBa3l297OA7r8fvKO844jM3kIRWz/WnR
 yIwfDtBTPtWs8bydVLCAPBE9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1upTDD-000HSy-1U; Fri, 22 Aug 2025 14:57:51 +0000
Message-ID: <bff94baa-f71f-420b-b679-b4466e3d3c2e@samba.org>
Date: Fri, 22 Aug 2025 16:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current state of smbdirect patches
To: Steve French <smfrench@gmail.com>
References: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
 <CAH2r5mu_Nm49VaLDvBA_n16MivzUojBBZHwQgS-JNbvL-UsMOg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mu_Nm49VaLDvBA_n16MivzUojBBZHwQgS-JNbvL-UsMOg@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

can you please remove my smbdirect related patches, which were in
for-next and ksmbd-for-next-next in the last days.

I'll post new patches (most likely) on Monday.

I'm currently at the point where struct smbd_connection and struct smb_direct_transport
are only used in very few places...

metze


