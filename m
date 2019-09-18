Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16FB62AF
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 14:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aWeMujnERhP12tguJBtxKz9DMKCFxqQbe+eUYWj9AJY=; b=gkN+wo9nOX/aSO1la7vxSd4rxE
	Ca2ayfzlVukOuvNb7ybqdvEQhFJO9bx1vz7pj5XUok/Sd9um7MB+H3jyBmedGd/KHqGblBDmF+nmp
	IhgjNcZHc93Rmg/h7EWa1LVN+gDB/ZjStiMicUSxw47L2bPix8GgwZqMhCKNAXKgoLsy2aUYROY3R
	dPriCWddbcxLAcZOZCjbXEz+wndudOdZagGWAVH8VsLol25/xtLkL5s0KCyAZH6Ej/M23RtXwSTkC
	JYhGcfnxI6txzE1TSkDSwu5zXg2mrrm1wJaqoimddJEte5LgH104ZoIKTruALqs+BhQCrBzCK7CVf
	zFfLCB9w==;
Received: from localhost ([::1]:39048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAYgy-006XIZ-D5; Wed, 18 Sep 2019 12:04:16 +0000
Received: from [80.20.169.36] (port=45298 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1iAYgu-006XIS-5N
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 12:04:14 +0000
Received: (qmail 30010 invoked by uid 121); 18 Sep 2019 13:37:28 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25575. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.291223 secs); 18 Sep 2019 11:37:28 -0000
Received: from unknown (HELO dodo.torino.wkitaly.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 18 Sep 2019 13:37:28 +0200
Message-ID: <615ad0349f8f42e406c086fb80d5e992a735c5de.camel@solinos.it>
Subject: Re: [Release Planning 4.11] Samba 4.11.1
To: samba-technical@lists.samba.org
Date: Wed, 18 Sep 2019 13:37:27 +0200
In-Reply-To: <CAOCN9rx_8eJR-ZgXrH6_zJFNDAOfoio+2Y89-QT_ZyCE0jcz5A@mail.gmail.com>
References: <43d2884c-c637-a028-2f17-9857483a11b4@samba.org>
 <CAOCN9rx_8eJR-ZgXrH6_zJFNDAOfoio+2Y89-QT_ZyCE0jcz5A@mail.gmail.com>
Organization: Solinos
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno mar, 17/09/2019 alle 18.54 -0400, Nico Kadel-Garcia via
samba-technical ha scritto:
> Will the experimental support for mit-krb5 be considered stable
> enoughfor production use? The Fedora "rawhide" copies of Samba
> activatethat, rather than compiling Heimdal.

There is this bug open on bugzilla on the Mit-krb5 on Fedora.
https://bugzilla.redhat.com/show_bug.cgi?id=1748860

There is some news for this problem into new Fedora Package?

Thanks

-- Dario Lesca
(inviato dal mio Linux Fedora 30 Workstation)
