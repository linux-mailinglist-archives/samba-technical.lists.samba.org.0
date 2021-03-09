Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E00332D8A
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 18:47:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VOdX6mEUmguvJPkHpTnBJz3kr19Wo8Z1Y9XdU54yLDM=; b=wmlvJtOPKYGOUfUmDmQ+fh7g1n
	5FI1zkk2VwQRAVKkvRfF+zKF6XZnMbfvlajG+lb6sQ+9E6tFOMBtBfqbeq8d6XX4SbfqAX5SA4Xcy
	zz4coO6hCu0HbBJjpbcs42P+ufE4WRT0zLWpTJLlvpZ4dfKBUUPGfv5MIQTjT7CXONDecpZCIvECp
	DGHkdTpYE2Wu0kDgGOy5xKK5iDWFUpUYSWp+F1qeIV4bIR9GQkmjPdYdttU1M+iHZhSslevV01PC0
	F/mc/EuesN9gSEEJnp1FN9nPQZ1mHYyYN+U3RrDFACLvJWq23N0YybIT1OJ/IAyzvG0jOe2QprsjX
	5mmV6Jpw==;
Received: from ip6-localhost ([::1]:54556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJgRv-004fa7-JL; Tue, 09 Mar 2021 17:47:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJgRi-004fRN-3G; Tue, 09 Mar 2021 17:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=VOdX6mEUmguvJPkHpTnBJz3kr19Wo8Z1Y9XdU54yLDM=; b=atReFtXH3GteXcixVh6lxYZYZA
 llqdrJ1otpfR46Pbb4n0MtMkTVgKx9SYrrsbZViALe12hSxbrmnnHwDZUez5RWn64jQDOyI/fsqt9
 LvrAmubnGhf+To1rX53YSrR2lFzC1SxpUYAJ/ScVpROL8QTskcVH2IYRgWTbGAygWtVNvLJn+R89F
 zxMbQFpWkRXkYQQl1jXNtqqhA24U9mjRbwntWMBqqyP/WpVfmyo+OsbBC99AzLcuiHunQRR5gAA4b
 khLmlozVFQETHCwOLlqQVvvp6aLAbaHU+6Dlz9b8ZXd1HPngqN6gyhl2GgkwW4O7NFMr7Fo3595xv
 dFeIOnK/nR+Hfmc38QbrPdiJZOWmojeVeP8FqRjxB/P64bvmCR65ixI2LKgYaTthuMHcpo919vvrz
 iXTNH4ng0xo/5VSH8I96RuK6hDGSZ/oGAxJDmuFtqZ/fdzLxfyXnGDvV7B5pBTdZY/7QT4c01MsZq
 +J6MG+5tdS9Xb1L6ZBOKlW3V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJgRg-0003VR-L4; Tue, 09 Mar 2021 17:47:01 +0000
Message-ID: <42a34d68d601abac752501257f614977f5d93b2a.camel@samba.org>
Subject: Thank you! (was: Re: [Announce] Samba 4.14.0 Available for Download)
To: kseeger@samba.org, samba@lists.samba.org, samba-technical@lists.samba.org
Date: Wed, 10 Mar 2021 06:46:56 +1300
In-Reply-To: <20210309125516.GA18745@carrie2.fritz.box>
References: <20210309125516.GA18745@carrie2.fritz.box>
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

On Tue, 2021-03-09 at 13:55 +0100, Karolin Seeger via samba-announce
wrote:
> Release Announcements
> ---------------------
> 
> This is the first stable release of the Samba 4.14 release series.
> Please read the release notes carefully before upgrading.
> 

I wanted to give a big and public Thank You to you Karolin for all you
to to wrangle our releases, particularly in handling the last-moment
trouble we had this time around linker flags. 

Also a hearty thanks to everyone involved in this release.  While
summarised only as a few short words under "VFS" in the release notes,
this is a really important upgrade of our core file server, and I thank
those working on it in particular.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


