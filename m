Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C1CB79F
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 11:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jhWnDH/2zzRXUe3nViKKbg04OHVK3iuFRI8M4XuV2BU=; b=1YpvPS4dTBNVbqhnWKpD5XfAjR
	nCkci0tfNOwyJB6GsIBDnBqh2KvKJ4PazWfpK5NtyU/yaCQREXX/DKO8Kcb5rOXInO3uVMjYebTco
	ZQQZ8LNaC6LI2aAEguP2LSn0PndEzks3ng35y2Y0IHmOzbSe4cYHS+MNB4rbUahj0FCQYYp/259LL
	r+prayY2psylCCl+/Z8InkDJNNTPPDCCGOtINtUuPieZlAdA7F5JblSAmDGteItSDF2Y6wf5Pv/cQ
	fzwHjAOMt5UzwfxBlxQuyMCiGio+O/hbr3XuoXlK7PBixu/czNterWdXClcUyiYCwzhApco2gRPl5
	inZr4+sQ==;
Received: from localhost ([::1]:52450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGKEn-0014wE-Dy; Fri, 04 Oct 2019 09:51:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGKEj-0014vk-K4
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 09:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=jhWnDH/2zzRXUe3nViKKbg04OHVK3iuFRI8M4XuV2BU=; b=IzhBzoPG42cj+59cW2+e8tjf73
 OSm0wOteRhjHLsuefxZjYKdXvE4NxwOef+/qGMMDguoBpcWso0bod4I1NMMK/e4P7GBPCpDDxEMys
 Lt8J12FmIOVhuzgZnj+wOQIocG4VD7R86b5v8PK946rRxJKUXVw5uw0Kp96TUYipLbeQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGKEh-0006s6-Th; Fri, 04 Oct 2019 09:50:56 +0000
To: Samuel Cabrero <scabrero@samba.org>
Subject: Re: About adding a new 'winbind:allow domains' parameter
Date: Fri, 04 Oct 2019 11:50:55 +0200
Message-ID: <5313918.ZBD0rEVcan@magrathea>
In-Reply-To: <20191003163758.xsetow666fudtkxc@aneto>
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
 <20191003163758.xsetow666fudtkxc@aneto>
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 3 October 2019 18:37:58 CEST Samuel Cabrero wrote:
> On Wed, Oct 02, 2019 at 05:57:52PM +0200, Stefan Metzmacher via samba-
technical wrote:
> > What is the reason have just a manual specified subset of the trusted
> > domains?
> > 
> > I'd actually like to get rid of all this hacks and just trust our dc.
> 
> Because some users are currently using the documented parameter
> 'winbind:ignore domains', and when new domains are added to AD they have
> to be added to this setting too. It is just a usability improvement.
> 
> But let me ask, why the 'ignore domains' option exists in first place?
> The documentation says it "can avoid the overhead of resources from
> attempting to login to DCs that should not be communicated with" but
> from your reply I am not sure if this is still a valid assertion.

In the past we tried to communicate with the DC direclty. We had a child 
running for each domain member. The assumptions we had date back to NT4 style 
domain controllers. In the meantime we know we can only talk to our primary 
trust to authenticate users and the DC will route the request for us.

wbinfo --trusted-domains --verbose

will give you detailed information now!

All those options about ignore domains probably date back to NT4 and we should 
deprecate them. winbind should only talk to the primary trust. That's the DC 
we trust :-)



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



