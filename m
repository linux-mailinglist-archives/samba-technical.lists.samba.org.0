Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC1FFE5
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 20:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=odDx3FO/JEagqXRp9XS2NTf8r3RACPhA3SrkO+pCSfI=; b=iUFLEObSbTk1NlO82pTEqhjjDm
	AOT75lj6Dx8bwBy1Q+HcCeoFABCIYu1tLEBlDtMUEN+dQ1h4tnlyaVhA7zoowwodjNfoR/++0zgHh
	BGkjL8crTgyzTMR0vfDfQAfdWgyM168Xnov+lO7vS3QOI5tC+XFy0s/mRIHNc8Hhh/5pBG4FvuyUu
	3PXIHzKGS6P5EIa6mzssuedTJjlrYMmOQpMrs0OzdSJTsUJo+yuoVUmO2jGkYHlQbJhrOZHmTGM5d
	Lpog6TEz62Y9R/EtSAlPkvnnwQ3WmioI03cA0rEzPdZ+fNKa49L9wluQsHhJleh8ZEzwf31ZH5dUE
	f+/bNmtQ==;
Received: from localhost ([::1]:31032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLXlI-0003RL-Ni; Tue, 30 Apr 2019 18:45:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:28394) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLXlD-0003RE-Rl
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 18:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=odDx3FO/JEagqXRp9XS2NTf8r3RACPhA3SrkO+pCSfI=; b=hdK/+tq7e/lHYIktHdtQYNn787
 ISL9n2vnsfD8UP3glsjV4evrj/oBb00mycpZjAwuy7fkAtvhLJ4G0ecYKt4QBrlGHoOjnmHGzAiUZ
 T5kflTTNrdud8r1zr64uMgjFXZF5qLlY4CnBj11Pu9yUx+y6zW9Ubhmvzzl7YUAJNG0w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLXlC-0002wH-Fq; Tue, 30 Apr 2019 18:45:47 +0000
Message-ID: <1556649942.21278.15.camel@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Andreas Schneider <asn@samba.org>, Rowland Penny <rpenny@samba.org>
Date: Wed, 01 May 2019 06:45:42 +1200
In-Reply-To: <3513637.hkN0grMHb1@magrathea.fritz.box>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 16:10 +0200, Andreas Schneider via samba-
technical wrote:
> On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
> > 
> > 
> > Quite right EPEL doesn't have python34-crypto or python34-dns, but
> > it
> > does have these:
> > 
> > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > /x86_64/P
> > ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
> > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > /x86_64/
> > Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm
> I think we are more lucky once RHEL 7.7 is out :-)

Can we use this:
https://centos.pkgs.org/7/epel-x86_64/python36-3.6.6-5.el7.x86_64.rpm.html

It would be very helpful if we could have a python 3.6 baseline.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




