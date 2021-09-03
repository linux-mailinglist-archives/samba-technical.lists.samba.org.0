Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 682923FF9A7
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 06:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pvnrqOUVX4koOMx0M+RdhNH1ukeN0k712Qrec7rp68o=; b=d2EB6BicgK0MD3v7W4/00z0ax4
	Gb5Zr0fxGFyk9ocQQqTlqESzRL9i8lWxbGIGUWaUslJUzptgWHVn7czFfLKtlH7NC1LSZkm4dXJYJ
	HFyzgBhZX8PVABl202i1Ysv7kMMvw0nHbProaY3EAfqheFZK15qU4k5en9GZWp4KfSVFRgSmVA4Km
	iSsQZ9+NAH1qdHONobtJXlpAp5ys9MnitlVdlAhIEw8QD+Ch0vYFTm+4H5gVdgkZ1oLocdAXlcxRH
	L3f9g1R5Xd1Sb+u7E+IGVBOwTfj7Fwn/0aO/lnoRYD83ff7jzQDjEd2+Yb0BKQ6wASF+LolRJptAf
	13mTKb5A==;
Received: from ip6-localhost ([::1]:61634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mM10F-00Ctvh-Fw; Fri, 03 Sep 2021 04:40:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65062) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mM109-00CtvY-Ry
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 04:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=pvnrqOUVX4koOMx0M+RdhNH1ukeN0k712Qrec7rp68o=; b=P3A6bC0MXRgSodQLlWgF1IvbPk
 xT5N+nrrqaevAkjBxLGDVg8YM/U4xyg5J5Famaq6YkVN4/cyEaa/gg5ZD3qfqiyNQ+dgJFlaog4zv
 40njc+UWEvF6c+OCVd2OCCdlpSjlAWd2ZLPTYzSV05Ivhjxt0NUyJd7tyT8dzf8luaflEJp6RDY5R
 L18bHB5aHM/3/P/C4lhI3af1HVv0hw7AGDq0bVV97h/mNw1mAPt+/jamKoZOhk7mrOpe5GFcl8qZ3
 rOLyrkConE76BV7r+m64TZdjAv7JVt07kP0/IB/+eKPAMm7C6nxu+g6jcurbMjtlJy3ZhgELVI4Qb
 ZAo/1uqc/0D+gi+qnrFiGT2/3aqXpYTkopWn/5wv9o83TrL/qtzJJZ5Yan10+uoH1nIoSBd5AiP+W
 cksTPbOmbtWz5fb10BQUf1Pkqp/h3w+GVZHHUyUY8Q8PPPVbCl+I4Lz4Z84jQ7rsb6WmXcqFsBB0m
 gdo5jqwnDeEuDdPQKXbF7xTN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mM108-004N3c-CN; Fri, 03 Sep 2021 04:40:29 +0000
Message-ID: <ebdac5cf71da609ed05e3ca121c3217a973be2a0.camel@samba.org>
Subject: Re: New developer - CI build failure in /usr/include/gpg-error.h -
 can't read, not connected with patch at all!
To: Matt Grant <matt@mattgrant.net.nz>, samba-technical@lists.samba.org
Date: Fri, 03 Sep 2021 16:40:24 +1200
In-Reply-To: <1325f3bc09eede86bf18dfd7c4af26776d6048ac.camel@samba.org>
References: <457c64e2-32b4-2de9-7c63-99583d679942@mattgrant.net.nz>
 <1325f3bc09eede86bf18dfd7c4af26776d6048ac.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Fri, 2021-09-03 at 16:00 +1200, Andrew Bartlett via samba-technical
wrote:
> 
> This looks like you are somehow attempting a code coverage build.
> 
> The issue is that GitLab has helpfully copied he CI/CD configuration
> file setting from:
> https://gitlab.com/samba-team/samba/-/settings/ci_cd
> to
> https://gitlab.com/grantma/samba/-/settings/ci_cd
> 
> Set the CI/CD configuration file back to nothing or if that doesn't
> work, '.gitlab-ci.yml'.

Also, as you are already a member of the shared development repo, you
may start again from here in the instructions, avoiding the issues of
the forked project:

https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_.28and_complex_first_requests.29

In the meantime I've also put the above instruction into the Contribute
page.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


