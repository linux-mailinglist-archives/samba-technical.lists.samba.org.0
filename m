Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D51435B3553
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 12:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=aOYLIgcF9kCsiChNnJAPjj2jLQ5L+ZqQHUNRss77PCg=; b=uORG8t8yCRIxA2EQNfzpJ3eIxQ
	l5Qg8fivXqgXNv3Uggl1PxeeIWC3yRB4JpsF5rmo08mJE41lLjOe+KZnzgfuAK/mM3wMRuCVOAXp5
	UvDhNku2F9JOVz64wUB/dr08oJK3YGHjnfKgJgGYiOPUmOXazPas5hyxyP+PwkIv1jIlGA4jFyrLD
	8HHYkb4Wywl7IauuodaBbY3mtfJ8iaLCh0TEgYL7/bi+BPypjFiS+rqTo8bOu7gnWg+Z1doPByQJq
	YlyVyp8qDPpO8/oiNiAO0xsLbowJluSgrY02n6poLSJGk4NRmYN82EfrQaet3Xti4Kf7wXJ+Ao9+q
	5XUAAlBA==;
Received: from ip6-localhost ([::1]:34006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWbL5-00064F-Sm; Fri, 09 Sep 2022 10:34:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20826) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWbKy-000642-LL; Fri, 09 Sep 2022 10:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=aOYLIgcF9kCsiChNnJAPjj2jLQ5L+ZqQHUNRss77PCg=; b=Yl6jIduh87B5wa9/QnmJ0QjsnI
 9a7uEyRxo0w4mKijMeoL2OQAMnNpmEpWxbu4mM+xdX6E8VABeBOjSiq9/q2be2iEndBpKI8yXdbXX
 n/HokuBGWAnOum4TPjOUC7xWjhslxziG0LpstIE1kzeuNnAocCrvc4KJrl3DfKZkQ5n8kvRbwAwyL
 QNLreS7rLHtnzUuiK3mZdvudHnqowcQTVnssjSU5kkMSTESYIs+xBkJfbKs+bKxVEPBGyDkppy4Gn
 3zcbHr7Sr0r0//7WOsYvF/XA1/aG0ucTQ9PDf5BV7mFPGDhLpUOIS+Yp1cOYkQS8+doCQjo0HV9Zl
 GtHzGVnnxnxjGDUhI6ldmJVrNxj+0LALB9NSRwaFJxQnnp8XGKsJI12brAjHpFP7Bh4wicaOysixz
 OMWG1a7/ZraWxMWmwP55RgxxREuu0JxCWxp6qCMIU5bIsRi8tvtM7CUX9IKOS3ewANEt8oUt/U/wS
 ImLWDFDnnkgmsgfS6F0I4ErI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oWbKv-0005dG-NK; Fri, 09 Sep 2022 10:34:14 +0000
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Andrew Bartlett <abartlet@samba.org>,
 Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Stefan Metzmacher <metze@samba.org>
Subject: Re: s4:kdc: Set kerberos debug class for kdc service (Re: [SCM] Samba
 Shared Repository - branch master updated)
Date: Fri, 09 Sep 2022 12:34:12 +0200
Message-ID: <5605851.DvuYhMxLoT@magrathea>
In-Reply-To: <cf16b3cd-dd4d-b317-98a2-d559b0dbb378@samba.org>
References: <E1oWR2z-007u9m-Tl@hrx0.samba.org>
 <cf16b3cd-dd4d-b317-98a2-d559b0dbb378@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 9 September 2022 10:53:51 CEST Stefan Metzmacher wrote:
> Hi Andreas,
> 
> > - Log -----------------------------------------------------------------
> > commit 761ce8cfe41139ab5656dec5cc05f2f576095216
> > Author: Andreas Schneider <asn@samba.org>
> > Date:   Tue Sep 6 10:19:54 2022 +0200
> > 
> >      s4:kdc: Set kerberos debug class for kdc service
> >      
> >      Signed-off-by: Andreas Schneider <asn@samba.org>
> >      Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> >      Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
> Can we please do this for all files under source4/kdc ?

Hi metze,

yes we can.

https://gitlab.com/samba-team/samba/-/merge_requests/2715

 
> metze


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



