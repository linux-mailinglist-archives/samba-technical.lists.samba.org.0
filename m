Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511979178F
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 14:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4f+yGsDecQtjTCtrAYAv9onN2N9IK0Ir7HYXyrIcvDw=; b=6KpIhgp9AjXkikPGcoCFYzJQ8j
	dbvh9z9qFC/hXZGdVhePZx2MMhc76mjf8u1c5RK0juG3VpVJMcXWGGdnVr4t7gvhegA53QPFWBBs+
	qkbnFC2T5wKSZzz3IIpj3aW2T8bp4WV2tWToTQ7iso32xC0BD2P2+TRAXHbBRL2txnrStv5dCFdPz
	Ckn3dNSBtojf4tlfEBofwUEoXpxswxyDxWghgtaJAyW9a1Fd5Aifsf5AjzYPnLBrFrfXDPOPeD9xa
	Ls/BjGPmVTNEFBKiwvDaw00TvZFSy69Mml6/widr8hRKaYd2SIky6Us8Fe7k1MWni73YnDkas7Pom
	+sc/8qKg==;
Received: from ip6-localhost ([::1]:54510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd91h-000LME-UT; Mon, 04 Sep 2023 12:49:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60348) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qd91W-000LM5-AC
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 12:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693831783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f+yGsDecQtjTCtrAYAv9onN2N9IK0Ir7HYXyrIcvDw=;
 b=e+UZhQa/8iJ3w9grcSa/Xm+rLRReO8iDYqricD2Pj1KumwW6IgbKKpGN0lgThxalf6wjEJ
 t/r36Cc7+w8/8p6PH/B49a6etuS2af84TyKNR0I5IOrVu1db1qR+ciTdGZzPotw94Tj6yF
 B2YlZ3ZxFaI3glWEpIPd2aZLZfwe5/0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693831783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f+yGsDecQtjTCtrAYAv9onN2N9IK0Ir7HYXyrIcvDw=;
 b=e+UZhQa/8iJ3w9grcSa/Xm+rLRReO8iDYqricD2Pj1KumwW6IgbKKpGN0lgThxalf6wjEJ
 t/r36Cc7+w8/8p6PH/B49a6etuS2af84TyKNR0I5IOrVu1db1qR+ciTdGZzPotw94Tj6yF
 B2YlZ3ZxFaI3glWEpIPd2aZLZfwe5/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-at2KgU9fPuWzA5wjOWE8HA-1; Mon, 04 Sep 2023 08:34:02 -0400
X-MC-Unique: at2KgU9fPuWzA5wjOWE8HA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE3C184AF9D;
 Mon,  4 Sep 2023 12:34:01 +0000 (UTC)
Received: from magrathea.localnet (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0DE140E950;
 Mon,  4 Sep 2023 12:34:00 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: `allow trusted domains = no` and `Unix Users`
Date: Mon, 04 Sep 2023 14:33:59 +0200
Message-ID: <1875713.tdWV9SEqCh@magrathea>
In-Reply-To: <f7e663eb-7fdf-8830-5637-4ceda0e9e90d@samba.org>
References: <2306152.ElGaqSPkdT@magrathea>
 <f7e663eb-7fdf-8830-5637-4ceda0e9e90d@samba.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: Andreas Schneider <asn@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 4 September 2023 12:55:31 CEST Ralph Boehme via samba-technical 
wrote:
> Hello Andreas,
> 
> On 9/4/23 11:07, Andreas Schneider wrote:
> 
> > Is it by intention that local unix users fall into the "trusted domain"
> > category or is this a bug?
> 
> 
> I guess it's bug and is_allowed_domain() should check with something 
> like sid_check_is_in_unix_users().


https://gitlab.com/samba-team/samba/-/merge_requests/3250


Here you go :-)




