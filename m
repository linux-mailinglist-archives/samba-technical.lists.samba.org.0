Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908DA6AEC
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 16:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=U8XaTXHXprGknaqWMeD2X4nF+H8LR5zN4mKFznmYuVU=; b=sNdgOfOzYwSz0ZjtbaPRaVkl1H
	WQS2gUoL6YhIpbPlBlX6nixqcCNVWPpjBwCv2b/AlH6KudVxL6sm92DOHaB6qwQte6l5D4qpEFB32
	UPpVyR7yYzifidC6iTOwADGThh6o3RpSioshm8JuLWnPGh6WQwIRZhM4E1NbEOnL7uEUcUFsNHjBl
	xMEJHGjPmfk+OmpbKaFr4J/r4mfXM76HnaDV3QShQisYppXiT4AxdqhE9G6nxY4wgq9pAK2Akvifo
	D9Vb4LVwL2CrRsfubVHyue9tQdVOxDebTWBz0rcywcGF46XkTohmeNfeoY2/C7eU0Pn+gqYmNUap/
	mibyF3ng==;
Received: from localhost ([::1]:48080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i59Xx-003D1x-4B; Tue, 03 Sep 2019 14:12:37 +0000
Received: from mx1.redhat.com ([209.132.183.28]:59764) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i59Xs-003D1q-Nd
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 14:12:35 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 999EF317529D;
 Tue,  3 Sep 2019 14:12:28 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD6E100EBD2;
 Tue,  3 Sep 2019 14:12:27 +0000 (UTC)
Date: Tue, 3 Sep 2019 16:12:25 +0200
To: kseeger@samba.org
Subject: Re: [Announce] Samba 4.11.0rc3 Available for Download
Message-ID: <20190903141225.GA2122626@10.4.128.1>
References: <20190903111941.GA15245@carrie2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190903111941.GA15245@carrie2>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 03 Sep 2019 14:12:28 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Lukas Slebodnik <lslebodn@fedoraproject.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (03/09/19 13:19), Karolin Seeger via samba-technical wrote:
>Release Announcements
>=====================
>
>This is the third release candidate of Samba 4.11.  This is *not*
>intended for production environments and is designed for testing
>purposes only.  Please report any defects via the Samba bug reporting
>system at https://bugzilla.samba.org/.
>
>Samba 4.11 will be the next version of the Samba suite.
>

I can see that ldb-2.0.6 was released which is required by this version
But I cannot see new release of litalloc and libtevent.

They fail to build with python3.8 and necessary paches are already
in the v4-11-stable branch.
And latest releases of libtdb and libldb already contains these fixes.

Could you do a release of before next release candidate (or at least before
        4.11.0 ) ?

LS

