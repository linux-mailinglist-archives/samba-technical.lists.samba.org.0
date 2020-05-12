Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEF1CF303
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 13:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2/OBGOQrOaBNB9ZmNnT42KnQJZ7mZIrnX55q/2DnnIk=; b=rzUTHjRzZndKgYg4hqNO/wfDoT
	0c0Z0ftRK/u2FTx0LPN7e4rQ/DW66hJQNGWhUK7nAtWl1HyXJAH8Q+sDrVQLcqO8fDZUJqVhMd41V
	TTXoWbXkKCtHv6l2AeXWAivEAGYzaJ5j4Pfu4Q4CIioSR2WUOsL7AMgubUG0UsPW1r9QhQvm3on9j
	5jVjIlWmGBxAzLWZrz52Cc5yMdii8Jd6MRc6AAlnWm47FxgvOA8EJmKU135myEIpp8qJARlg8/2jc
	qNeT08fNH8gTizR6PIBp6hXrPRvh80xwCMLfXDfU2Zc7vsLoE11NIDPyKPYNW8UvD6S+jMPdSSV0v
	ojmsH3gQ==;
Received: from localhost ([::1]:27062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYSf4-0041ce-2a; Tue, 12 May 2020 11:01:22 +0000
Received: from zmf03.inasset.net ([82.193.37.22]:43458) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jYSey-0041cX-NU
 for samba-technical@lists.samba.org; Tue, 12 May 2020 11:01:19 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zmf03.inasset.net (Postfix) with ESMTP id 22F71BF6A4;
 Tue, 12 May 2020 13:01:14 +0200 (CEST)
Received: from zmf03.inasset.net ([127.0.0.1])
 by localhost (zmf03.inasset.net [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GTlmGupuvIbB; Tue, 12 May 2020 13:01:14 +0200 (CEST)
Received: from dakota.saitel.loc (93-34-9-216.ip47.fastwebnet.it [93.34.9.216])
 by zmf03.inasset.net (Postfix) with ESMTPSA id D19D0BF627;
 Tue, 12 May 2020 13:01:13 +0200 (CEST)
Message-ID: <91974a95e8f5b1c19d482794452b04bfb190784f.camel@saitelitalia.com>
Subject: Re: Problems after upgrading file server to 4.12.1
To: Ralph Boehme <slow@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 12 May 2020 13:01:13 +0200
In-Reply-To: <c5a60f12-349f-e6c9-d7e3-62d07a608d23@samba.org>
References: <c6c8418330b35b7397a4b55927e98ac66bd2d19b.camel@saitelitalia.com>
 <c5a60f12-349f-e6c9-d7e3-62d07a608d23@samba.org>
Organization: Saitel Srl
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
From: Daniele Dario via samba-technical <samba-technical@lists.samba.org>
Reply-To: daniele.dario@saitelitalia.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-05-12 at 12:02 +0200, Ralph Boehme via samba-technical wrote:
> Am 5/12/20 um 11:42 AM schrieb Daniele Dario via samba-technical:
> > Hi Samba team,
> > some days before release of 4.12.2 I upgraded our file server and our DCs to
> > 4.12.1 from 4.11.6 and everything went fine. These days of lockdown not many
> > of
> > us are in the company and as far as I could test from my linux box, auth and
> > network shares were working.
> 
> this is probably
> 
> https://bugzilla.samba.org/show_bug.cgi?id=14375
> 
> A fix is underway.
> 
> -slow
> 

Just tried to port the WIP patch for 4.12.1 and build.

After that the problem disappeared.

Of course I can't say that the fix doesn't have side effects but can confirm
that with patch I don't see that particular problem anymore.

Will wait for progresses on bug fix.

Cheers,
Daniele.


