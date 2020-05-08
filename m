Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0221CA9E8
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 13:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+VHmZZX/dm/OOmIdDHih4GDVopePjOe9GE3ftHKb+f8=; b=E4jspcjH5pQhASTrMuTCEKKijO
	aSCOPmOtAP/xfsGr6aFSIGPyHo19f8dzsEWCAp6DKokNTYRlrQH4/sfcH1tyqx6jJpbL0LhJOcY43
	kGCfZSjx/YfFD5FJfFQM9PORrOBXTfHlYf5rO8h6EKhevBcCTsbg7XFkziGFaI9pc0R9SIqPu5i9s
	HhOBSadp5cAAzWKlwoU9NP4V5FBLGYcSrA8PRZDnri4noCZxTQdESOHg1ZNa7fEUMjeHCSunhdxaX
	la1AUdwQgr915Kg8+4NTtvGQ9l6Duk9rARV9lxwVaqUJ+Jfsr1vC6JU4U3m7pek2lFFhhu/vW25uf
	cA7hio6g==;
Received: from localhost ([::1]:59650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX1SL-003ELa-79; Fri, 08 May 2020 11:46:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX1SF-003ELT-J9
 for samba-technical@lists.samba.org; Fri, 08 May 2020 11:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=+VHmZZX/dm/OOmIdDHih4GDVopePjOe9GE3ftHKb+f8=; b=LQlqqhTGe58Hm4U4wg5xF9xUsY
 VMJuAjxjSZ6fDsFquXow96J+6KRnAbHbhIbzThg6XgWBzcFVivpESUwOrvPEkF0OC5YSTe1bzfYVv
 GtkEx7iZVGnqe/4PK3LCqH3MK86QEC3trGMGwHxdDieCBvn2sKGJGyiaTMWH0Ofmdh9DD5JFVwlbT
 L6wSVJtPlIfw71+eAN2hf7czi14M8nR0aot7eihMtoY2nn1BqxK2Ih4PDrP3SFaH002anw8nHSlPl
 m/XTyjGpLaivvdjctZqaA/KMGXK/BRH04YQDdWoPiekOasBXHmTZvHj87eqOwYORpYwcD0uGT4F2O
 2Y8l1ZN4a5ZCEa9sJa0n0AkwlTnCoujJOr+McsMBylxW4IVo8phFV5cocxWD/33hPvkAhtKoeipMx
 5LhQmF2cX0OD6+ENzt5B49Vmfco3o8XRFEpx4sYOGzdxdAFDT23wjxdR80jrWEWyjWnsLINeYMiha
 VOTfia2XQkNizDyCemkL645h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX1SE-0003ip-7b; Fri, 08 May 2020 11:46:10 +0000
Message-ID: <612d83f8d6a2bc0f725cc3a61d22f6b49eb4b01d.camel@samba.org>
Subject: Re: Gitlab and Sign-Off trailers
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 08 May 2020 23:46:06 +1200
In-Reply-To: <2494384.Zab67dHBYY@magrathea>
References: <2494384.Zab67dHBYY@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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

On Tue, 2020-05-05 at 17:41 +0200, Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> I've looked into different solutions for checking sign-off trailers:
> 
> https://gitlab.com/libssh/libssh-mirror/-/merge_requests/104/commits
> 
> I've found one working solution so far.

Thanks for looking into this.

We should also use the merge request checklist feature (as seen on
GnuTLS), in particular to make new contributors consider that they need
to up the 1h timeout on their private forks.

But while I don't want to block this, we really need to pair it with a
single, really good "Contribute" page on the wiki, with a single set of
clear top-to-bottom instructions on how to make a great merge request,
including Signed-off-by, DCO, patch style (mostly the clean, no
reverts) and pointers to our other stuff like coding style.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




