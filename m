Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07567347E17
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 17:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Ju0FMLg5TrkWPQ6IKJytQgY1Q9afpLbhFHYmBWgJXuw=; b=pY3wWlNcWAInBsZRg2znJUXGpv
	3SuslpCEjR+2YCV0toC60N+MxebDItGLizQQR2fnZdQVYryCBkGegjs35TBSMNiuqhsGXlFSTcWd1
	XTm8EEVtNCV4ZKY9SNT27t7OscfYtSVOHOaqPZBeVcv3uuE3ppVJN6Lwwc72CIv5w6lai7HopwUPz
	EABnMWxS6dCzVw/QO8kfdkVv0+zjmOgleGYPTqvB6owVYR8Gv/YH6Hx4TUph1VWZ48/jT8993Xph3
	VZPlIq9ezH20bCiHduyyOwm004Eo0qXIoXUMtJJDdLKOJroCnlt9ryDIonri1Cdr7PwuV3I7WQ0Ox
	92nl4tzg==;
Received: from ip6-localhost ([::1]:37190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP6dG-006cCC-Vt; Wed, 24 Mar 2021 16:45:23 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:39541) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP6d9-006cC4-L9; Wed, 24 Mar 2021 16:45:20 +0000
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1lP6d8-0007vx-Hw; Wed, 24 Mar 2021 17:45:14 +0100
Received: by intern.sernet.de
 id 1lP6d8-0005t8-Ex; Wed, 24 Mar 2021 17:45:14 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1lP6d8-004UpC-8P; Wed, 24 Mar 2021 17:45:14 +0100
Date: Wed, 24 Mar 2021 17:45:14 +0100
To: Jeremy Allison <jra@samba.org>
Subject: Re: [Samba] Ask not for whom the bell tolls HPUX. It tolls for thee..
Message-ID: <20210324164514.GA954802@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>, samba@lists.samba.org,
 samba-technical@lists.samba.org
References: <20210319175422.GC310511@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210319175422.GC310511@jeremy-acer>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2021-03-19 at 10:54 -0700 Jeremy Allison via samba sent off:
> Is anyone still using it with Samba ? Does anyone
> still care ?

HPE still builds more or less recent versions of Samba, currently 4.12:

https://myenterpriselicense.hpe.com/cwp-ui/free-software/B8725AA

so I think we should not remove HP-UX support yet. And FWIW, I also have
customers who still run HP-UX.

Björn

