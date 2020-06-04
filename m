Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05C1EEE8F
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jun 2020 01:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HtezERkB/K+XtfRXnB+ZN/CWoW9YZLz2ugV00K/g9Yo=; b=1HArW3dg5k3FncCF/TARe9hY8q
	hrgeAqo8I0XXo6u+I2GmCJzjscNEfZHu1qvfEXQiWYb4jCWiiZdwDNjdaIG1DOyDmbbV6kWp9qvLJ
	096PMf+EWBzkSmEmrs/QtXep6KIhghf5ZMPGM0TgOFp6e7rZYB65i9vW+uU9z1khwFSkCkNCSprFu
	hLorEM8MG9CWyuRGD60Cul7MCzM7nrZtrAJ62qNp2pOd9oWZdYO7mlHf8FlLW63qfhCtYYbd6Rwgo
	66VHGV7feUpbeWVMqn/V99RwLcTuIk/JTU6gYum6lf0eIZNWvyzAYGtbOGVQPjuCO28Oq/V5m+zsM
	sy1ebC7A==;
Received: from localhost ([::1]:22004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgzk6-0090xf-Jd; Thu, 04 Jun 2020 23:57:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgzk1-0090xY-GR
 for samba-technical@lists.samba.org; Thu, 04 Jun 2020 23:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=HtezERkB/K+XtfRXnB+ZN/CWoW9YZLz2ugV00K/g9Yo=; b=Xw2p91b9UIJ3QQXm98CwLuHjda
 2/yxgmzgY5PXkTP2hzuEQHU13EyokdB6YEA3jDo6YE5TKqYAhie4BLIskeyMGAGC/LQgc+P/TChNK
 ppNdxxqDLhCFcStySlAfxkwGlxQWtLljjNMOcXxRcJCLOTj5wktRijIeq3twhERxrd+Gy8fn5JJZX
 9gjcmDg2V+abfP87tXBFrWRl5+HF5g+4DOfKKMHLXl4e1WvMkpMpxVt79yIDQ/jsL0+NaHX4lTbne
 iRdgAgPCUABFcDZ60bzSf831Ty6cNpHy5MnxfA4kqeYuTt/QMJIRFtVSA7+b5Zc5KOON3sWijGBwF
 DSOsTMDgzsD1KkLZoILQnsASd9+ToA28CqQnR6Mvbwz0nuKUMkBKGJ01bOWVhMDxtoWwx3lVokqQY
 243fqHAY0S1sGp4NusA6FPujT8GFLnzD0oFKhbqKotCq9f4rH/XCCJg72fWFr/iDd/i78e77FLUsp
 xJ1bzDLB7LRvFa4YlCYOD3Vr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgzjz-0007UL-RW; Thu, 04 Jun 2020 23:57:44 +0000
Message-ID: <32da309b6d44524c5ada1049eb3c408a805c8e77.camel@samba.org>
Subject: Re: Samba Developers Guide
To: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bj@sernet.de>, 
 =?ISO-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Date: Fri, 05 Jun 2020 11:57:38 +1200
In-Reply-To: <8329a7d20be2c97a1c44ef37fbdb8cdc53938726.camel@samba.org>
References: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
 <87y2p4ikw5.fsf@suse.com> <20200603111840.GA714675@sernet.de>
 <8329a7d20be2c97a1c44ef37fbdb8cdc53938726.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-06-04 at 07:45 +1200, Andrew Bartlett via samba-technical
wrote:
> 
> That sounds like a plan.  Step one for any update would be a vicious
> triage of the current content into a wiki page, clearly linked from
> our
> new 'Contribute' page.

The right place is of course our Developer Documentation page on our
wiki, which is actually pretty good.  I've rounded up some stray pages
that were not linked recently.

https://wiki.samba.org/index.php/Developer_Documentation

There is good info there on how 'make test' works, autobuild and so
many other Samba mysteries.  Of course it needs more, but it is a much
better start than the old unmaintained developer guide in the tree.

I would encourage others to keep contributing content here.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




