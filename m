Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D09005298FA
	for <lists+samba-technical@lfdr.de>; Tue, 17 May 2022 07:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=S7BPgVhIA7U0B3tfQ386TG97jrPRnlXOiGANPw4M6bY=; b=3K0anS6JcaWaGu6f8OvKpmD9U6
	gJaCBFOFE8RYS325Fg52Jm8HibB+fmyRNlysWrC5gf8qxsU49zlZV8wTD9xYvPC1BgctPSOeq98Jl
	Db7So0GOKf8/Ny4VZCL9PGesmI5u5GMYBYgslD3neu2hygWGMzHcnMGsuFghgMNhfYsh+TRZ4TM3T
	v8ghH84+ycNakEDt6P23P+qahMPFbYCBN64lJ5LDOI2GB205jU5pW4qgUqaF9ONGx/cJ4MSkKXXw/
	Oa3fa7OMQT7IjZ8Lwftvla2FbTQoBwhs3od45BgzTYn/h26ckFhoD+MtdLJXwW78Obbn4gJa76QgI
	t2+TNCdg==;
Received: from ip6-localhost ([::1]:61058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nqpVI-001jdH-9N; Tue, 17 May 2022 05:12:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nqpVD-001jd8-E6
 for samba-technical@lists.samba.org; Tue, 17 May 2022 05:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=S7BPgVhIA7U0B3tfQ386TG97jrPRnlXOiGANPw4M6bY=; b=ES3xm+h68rrWtqOVSmfK4kqYWo
 GAFic4h9vmU+ne0kuKWrZm47+8d2e0uSwuET5yIz2Z0ZyMWruoEJ8ea5/A4F0Nr9puTF9rx5eWyxf
 vGqapGwyokiyONRsfZQZcbKs/5l5Sbjh4LWW2q4p38vPhbkSNcWE31USSGL+XI6zI+oJlHTOBYmUW
 TcXIKM4KKOLMp6NI+m93DlP2ntI1XbHwqxMclBADD5PSwiiP4/LKMhAfCROl4hbo2QBKz6ye5DNgT
 ERWEzR/ga4U7XhyMuJPT7u0vqfJvXcIgrqz6ltWIwkYq0xYKl7b90gP3Me+KWgSUwWq4fwccCChf7
 Ho3nu+ef8IzKKHvm9kxmQQpJ/f0vQxvKTkLDiL9jjjLN56eHDDOT13EjjSyVxm2tkowSq0uV9hoIC
 CZ21Dneb4I2DZ65XxlLr5/QgRAchFQwfKEcK/knorBvtervPTdhwH4smIs3NHYokCF46nB8Mepqqc
 TbCFpsqvUCgqtpEs0na47D7c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nqpVC-001FSw-Ck; Tue, 17 May 2022 05:12:10 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: A blog about my "Dollar Ticket" attack (Nov 2021 security issue)
Date: Tue, 17 May 2022 07:12:09 +0200
Message-ID: <2754825.mvXUDI8C0e@krikkit>
In-Reply-To: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
References: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 13 May 2022 08:22:17 CEST Andrew Bartlett via samba-technical 
wrote:
> I wrote up
> https://www.catalyst.net.nz/blog/stay-curious-lessons-doller-ticket-security
> -issue to explain a bit of how we got to the big Nov 2021 security issue.

I finally had the time to read it. Great write up Andrew. Thanks for sharing.




