Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0EF4F3D40
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 21:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=456sYnFSB+H720H73FghjYcJYtnSLCoHb0763fEzwUg=; b=ScoHhE8dAl0D2Xp6PmDyR7SNyd
	rrNvWuAiULakBMkG77EWIJfD0XInXqGd5gn2jmOC++aLDgImqHbPrYsZSCGC7nMYFm7wEiTMbB8m2
	tR30b7WsP/8mYuCn2IvfYnd77YFEn2d27xxAJuqdRBOV58j6Ndn29dE5asjTzsBDIhLMzPO84O2Af
	NTyvZOrmgdEuhwe1F+b+5c8svuDZ7KRD4ppJG4gvYNUN47tEEVRRlYGgGPep8FGGuiWucvdDbrmzL
	TgLvqxRmy81Lq7MbUTog307/8qACy1HZdOy2cZUVs3Kqm0N9LCbYmZjHXi9huMwLLUMQ+y7RYq8Pa
	2uFaquKQ==;
Received: from ip6-localhost ([::1]:36168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nboQf-00ABvN-6x; Tue, 05 Apr 2022 19:01:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nboQa-00ABvE-2h
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 19:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=456sYnFSB+H720H73FghjYcJYtnSLCoHb0763fEzwUg=; b=wr1GMp+rxqW7My/GVTTlxTjXX9
 dsfHRXr1/850oGLpURx6hi/TGJNrG2aPjjPMYCSffTvnINAhlvSwkZuDPuZnOjSNFtp+scfSakfAv
 D+Kron/ChtGaU5o6oT4hoWwTufBu+rcZxib/5Ch9xFuRXpdmpDwiXAgPjBx0ZzN23PAdP7e05CXVh
 90JobE7Paxezeq0Hnr7WmKYEAaXlFbo9wvzc/7bI78JWK7oeWnhgU8F9+K15YltSLdVQyUg3uI2IZ
 H6kzLqwoC/5uyqSuifE3egjElrORoxcibncjfZ0kZcPaLKpOxyz+O+3OI/TeevWotogHEQipr15w9
 WSRiE3X4rwCJ6Td0A5y3w2bFB1G1kmwevQ78e6w4MA91vgzKS15fCdUK6pgEAJUgJIiGtZoTvzhXk
 0G7YNJttXWInU4mpQt/DJnr38S+DV4ot9KDqdo/zOrogbeVlcz/NCrJ8+EtSiolEWlR9pP9gNTelA
 gfFW7auBIqM8SK/hT9Eu2rn3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nboQZ-005TLU-1a; Tue, 05 Apr 2022 19:01:19 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: doing a test build of samba
Date: Tue, 05 Apr 2022 21:01:18 +0200
Message-ID: <9327243.eNJFYEL58v@krikkit>
In-Reply-To: <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 5 April 2022 00:52:14 CEST Michael Tokarev via samba-technical 
wrote:
> So it looks like the answer is "no" :)
> 
> I just dislike the hacking around renames or duplicating the
> source tree for different builds.. :)

`git worktree` is your friend ;-)



