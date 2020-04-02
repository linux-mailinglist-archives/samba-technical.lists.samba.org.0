Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572E19BA46
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 04:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3BCBmWIVxNiZ/aQyyxld2xfDHxP1UZdDGASqs7BoS0c=; b=QzgEq0+SGdaY0qNVwGenJGRO7X
	P8EPxYbpA9cs4HOvSXO3v6JTOfm6kgWy21wrminwfQ4Iao9k4jkN+UEZl71lNi1iDqpnMfxS002wT
	mR/hnutjm1GWbxmEvMM4gEn1z254vvFNEK1tVTrTD2bZnUtwU4iaQUtNAMfk1B4RNE5vm5XlahMb1
	TJwtb0W4w/e6iK7EtA4zw0otbn9tq0eeMTokrProEWXd3jTZwrzqrdwCIFTTOPzSEAM3ZcGD+f4EF
	+TIzyOufGutemGiz1Lwvni9Cbc4YF0i5DyhzInwFsCx+xmaSAc0LlUL0TPQVBi3/OsRQxxKDPrJiI
	UXjr6DTA==;
Received: from localhost ([::1]:47902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJpXl-00339f-Ds; Thu, 02 Apr 2020 02:25:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJpXa-00339Y-Ob
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 02:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=3BCBmWIVxNiZ/aQyyxld2xfDHxP1UZdDGASqs7BoS0c=; b=SAw5o+yfsqQaBGAHIDudG8EsZa
 nqsHwUMcS30J1Ry8SPSHB10A1RmLeeSJD2zkrHPxsN5n9LuHqdpASvTF0Jh4QB29XGbLbHaPaVZFL
 xZw4yQnshrVYuxqUuQ853tLzB1AkIrOokAIHUO7r6nRAvfYEzVGfxNTFhfgvzcWqA6n2pKglu32w0
 aPWw66Iv5HY+yIb/Up29FBENREFR0wccLQuRbx6ThBy0dj4nhifUyiRHvD+FqkQEpL15420klgWCR
 GdXU2oxba1MswRRUmWh7ZPFOu8K3IUlRrRWT72y3QMIQU8+qhNuUAR65gJwCWdxg2mS6ph2z4ccat
 zmjgpcsMMH2RHuQBjsi+sRFLy9yoBtj7DAYwDxF7LAkZeEvAr8Z0/TL1L+m34hkvY/7dh00VkaHd9
 KFa8GaKo0B30e7vjsc9SR071nUAh1Km5T5QgwS6ipAo54a1X78I3YvxPpBtYN/NtHlu8Y6aoNa01/
 6KfEv6dDQAvmWavvMR92wVD7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJpXZ-0004Lr-HR
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 02:25:10 +0000
Message-ID: <1a82a7b8c32a9e08c096e40f4aca3510d7194c29.camel@samba.org>
Subject: Re: GitLab CI outage
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 02 Apr 2020 15:25:05 +1300
In-Reply-To: <e8419b2342242a39ad6d34e96c0857ea5cf18c26.camel@samba.org>
References: <ff467d0c1bca19cb97d0668beb144888a21860e7.camel@samba.org>
 <e8419b2342242a39ad6d34e96c0857ea5cf18c26.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-04-01 at 18:43 +1300, Andrew Bartlett via samba-technical
wrote:
> 
> Sorry, I think this only impacts backport work to Samba 4.10 which I
> was doing. 
> 
> I need to parametrise the 16.04 image IDs here if I can't make the
> 14.04 image just run on the 18.04 host like everything else does:

I've rebuilt the runners with this change and the backported tests
appears to be proceeding correctly.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




