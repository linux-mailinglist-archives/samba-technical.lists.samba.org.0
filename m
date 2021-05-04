Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAA372D55
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 17:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ewBstqw6NLlcTGYUT49m9Da5k6scm8U8AZZ4CR6qjiY=; b=kk/uKQurjAsrfmXeojLQ3hk+hR
	c+raoH3wdk8s4WVint3RLMGWEwl8NKYo8v1epF9FKog6Vdg7yBEaqbj61scoGkeg3kC4RLI7YfDpJ
	X8wq2KhfgwMw/oyY4bNXrfhMYhAbcgasOf3nVnQoJPJpo06C3KLdT3Gie30UFed6w5udK0+e5IeBM
	37F++EEBUls/C47GCmhNt7e3v3sli5W6fjBkW6/CfMVAfOmofPP7gFn64hbQ0p1XwiwWXmMkJ7uZ+
	4yN5gXMChpxfZVwjUDsxfYnmomp1PTtgCeunF8OLM01wCWL9rKYvixvbAepBJKvgOls8umTbKpJtM
	RlM9ZLRw==;
Received: from ip6-localhost ([::1]:58584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldxM5-00FRbV-Qg; Tue, 04 May 2021 15:53:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24082) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldxM1-00FRbO-Fl
 for samba-technical@lists.samba.org; Tue, 04 May 2021 15:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ewBstqw6NLlcTGYUT49m9Da5k6scm8U8AZZ4CR6qjiY=; b=PKM+RKy2ruDR9uLAz/X3t9ehcb
 YX/4Sa1jdEVwZSJIdhZXhyeKrYjqrp/Jm6Q8bjkJbaS1/ZhaUDb2XLoz7unf34kfH/eB0hAqnp2tH
 qeX92U4XQgE3+6Ey8WuBGDYVoyTHQ/SJJdzbmwYVwsfy0IZFL5XaQuSVm4py1AGN+4QKGM3V/yDod
 0RdI8SEu492sVTH6q0Fc3x2gOsZfNmUw6T0BIpuI+oF3MGvo0nBQa3SJjoz3SUnpWaKtKhj9Aoo+l
 jVvQu/N/YZgji4ELLXBza/30cDSxIGKyWwsnNhEcMeqWz6TAmA2moHehrD+0hc6MEgGHLQcKUJksd
 OpLt+vbgG7OA35l1US7uay9tI0xcmMpojw0UINAhxkJTdGRtE70nEYSwl6FQIqcCeRdlrEQ0iPMa6
 CEvTLqfvfH+rug118W1QRzKG7/+eKX25m6A4OFEAePb6JaDbMsJff8fIC0YnVzbbd/SQ05MfGzqkb
 U3RH5nWzrn3N/E9UG67Ujliq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldxLz-0007Jf-Lc; Tue, 04 May 2021 15:52:56 +0000
Message-ID: <975bee8d29597024b638826961aba1c1fd5a3500.camel@samba.org>
Subject: domain\username requirements and 'map untrusted to domain'
To: d tbsky <tbskyd@gmail.com>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Wed, 05 May 2021 03:52:51 +1200
In-Reply-To: <CAC6SzHKr+x2-1EZq_zXQDsrPpRaqwKmBLrsv6nMobSY2aa6kQA@mail.gmail.com>
References: <aaf1bedfbba1dde583281c86eaff5f73d8008318.camel@samba.org>
 <CAC6SzHKr+x2-1EZq_zXQDsrPpRaqwKmBLrsv6nMobSY2aa6kQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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

On Tue, 2021-05-04 at 16:43 +0800, d tbsky via samba-technical wrote:
> I am sorry but today a user ask me again why our samba service need
> 
> "samdom\account" to access.
> 
> that's issue https://bugzilla.samba.org/show_bug.cgi?id=13543. but of
> 
> course I told him that's Microsoft's fault.
> 
> it's interesting that many of our services are using ldap to
> 
> authenticate against samba DC, and all of them can use
> 
> "account/password" to login.
> 
> only samba file server need "samdom\account" to login.
> 
> maybe new developer has some new magic thought which would solve it
> in
> 
> a blink of an eye/finger...

I don't think you understand the purpose of introducing a new
developer, but regardless I would note that you are welcome to try the
suggested change on the bug and report your success or otherwise there.

This may influence us in changing the behaviour here, but note that any
such change would also need tests (to ensure it works and keeps
working).  Your Samba commercial support provider may be able to assist
if you are not confident writing those.

The primary blocker is the cryptographic behaviour of NTLMv2, which
means we can't change the domain on the domain member server, because
the domain is part of the password hash calculation.

Direct LDAP users do not suffer in this way because the plaintext
password is communicated to the DC and most LDAP applications make
assumptions about the username and convert into a DN (otherwise
domain\user or user@REALM is required).

I hope this assists,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


