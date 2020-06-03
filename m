Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6851ECE21
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 13:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+KRzgqrfE8mP4hxV6uyiw5xrvxLwU7KXWcT2Rm/mA1w=; b=hkyI2+kjHHUDmxthh7fOIEz3uW
	pG7WWz2nVm+iARN4ElxGB3Kzvlg3CJeCWwEFvL74CpLHa1E+SnfuY16jksKU+g6dAAKA372uy3EIj
	Rc91o9TzXe4MFGyYiwEZW+pQA7yEdfNG+4eFCznYygr3WKxvS6vnUmH6tPpG21xIYjLLv+uIxMvOs
	Kx7R43avB4PkZtH97U+ry0wblDa0KTy7xRoe/+FmUc6vIDW7NsLnulPZqgjqjQ1gV3zi9A5xbrgwl
	VpWoe8TMFoylYEidOpQWcmFFwctlJO+LI76s0cvkUyA5lj/O0k09Y2xM9EP7HHl5nKxX4qXsFoTWy
	g/R0P1yg==;
Received: from localhost ([::1]:65434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgRPz-008cKN-Ey; Wed, 03 Jun 2020 11:18:47 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:50157) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgRPu-008cKG-6z
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 11:18:44 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jgRPs-00038V-R0; Wed, 03 Jun 2020 13:18:40 +0200
Received: by intern.sernet.de
 id 1jgRPs-0005Sm-MU; Wed, 03 Jun 2020 13:18:40 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1jgRPs-002zyZ-FX; Wed, 03 Jun 2020 13:18:40 +0200
Date: Wed, 3 Jun 2020 13:18:40 +0200
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Subject: Re: Samba Developers Guide
Message-ID: <20200603111840.GA714675@sernet.de>
Mail-Followup-To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>,
 Andrew Bartlett <abartlet@samba.org>,
 Karolin Seeger <kseeger@samba.org>, Jeremy Allison <jra@samba.org>,
 Richard Sharpe <realrichardsharpe@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
 <87y2p4ikw5.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y2p4ikw5.fsf@suse.com>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
X-S2-White: [185.199.216.40] (port=34833 helo=emil.sernet.de)
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
From: =?utf-8?q?Bj=C3=B6rn_Jacke_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= Jacke <bj@sernet.de>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-06-03 at 11:00 +0200 Aurélien Aptel via samba-technical sent off:
> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
> writes:
> > Can anybody say some words in support of this, or should this now also
> > be removed?
> 
> As samba grows more and more complex I think a document like this is
> desperatly needed. Perhaps it could be updated with the content from
> Ralph's sambaxp talk?

given that the mentioned document is so outdated, I think updating it would be
like more or less like rewriting it from scratch. Of course a good devel
starting point docu is required but for this old one I would not object to drop
it. On the web there can still stay that old one archived with the "outdated"
disclaimer in the background.

my 2¢
Björn

