Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A871EEEA1
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jun 2020 02:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=TxCYnW/y2DLob7zNtXlfudcA2aszNYiA8tYUMbZZDWI=; b=2HPnL4UGV9yMTPkijLfH316qLA
	vTGE/N2NykwCilmLw5qg/p7q4b/69F26YqJx3yOVPn9zJff0XCerrnQ+9QgyKyZA7VXRoGeleRdYb
	7zwSRnsHCszpyTCTxrnHbR+2UFf3Dz8cMDO0WD3JM0PVJDufPFyBsIzaCzCDV529sxkyc0f5heIW8
	+4bNWdGGknv27zw9dDYdv1DHL4POSzp4bhXMVpVanSn9f6uvWh04ruCh6qanfNCzQ0GXJsIfN649s
	NqkhjRfh+mee1QqnfmzhPNRoCbepgf+Ayadq92FPvne+BlrfQw39TQveupd7Fx+LH9/BuWy6vx7ax
	iAVQYgTw==;
Received: from localhost ([::1]:22750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgztB-009174-3r; Fri, 05 Jun 2020 00:07:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgzt5-00916x-RZ
 for samba-technical@lists.samba.org; Fri, 05 Jun 2020 00:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=TxCYnW/y2DLob7zNtXlfudcA2aszNYiA8tYUMbZZDWI=; b=1YXH9hukTV0wAKWbC2vu2wPNim
 WGFFMFB+ac2RAGeCcnvrQ4MiHe770HXJ7WyhB8SUe+UHM+VJTgq8l8b+c5PUV3pwcgGRFZDoB7QVD
 b6rC4A1/c892Q0SGdrvwB0xbASC3MZtpnwq0dgD89jXwLGp4ukty0/fOWgYk1M9SaP5/I+RXvNHRr
 p3VukzVVDlucqOF/INT8w+VI6t33NN5KkOAZVv5abtFAZOF50wsn2nnkTrXIEdv4Uz0Q+ZylvrW3/
 bLZ60wJ+4IZsXYrP0thpjmcZX0Tw3jAYx0NvmCnZ2aonuSw0N8Gd2r/Y5DLQAi5HbtiI//hpXERNq
 5l/fcizSPDw42X3Sa1Cv3LzWn8wgqqvMvKIX9AgziAjePQyiBGac7jeQF0SzajAMrMN5R6G/Nfm4W
 YtRsis6sJnHQf3ESuIg2/2zkUWn6ZiCq7aUs9fpKq8mBtsTxfeZAR+UA8Pow+fzwDaUlbH4fU0gDF
 04PrZk7DwGzaBNIqovuaU+3x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgzt1-0007aZ-Ed; Fri, 05 Jun 2020 00:07:07 +0000
Message-ID: <c2d4f9132f8a70749d6019acc5b592f32415d652.camel@samba.org>
Subject: Re: git signoff+ and review+
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 05 Jun 2020 12:06:56 +1200
In-Reply-To: <2877725.qJPT1UHR8W@magrathea>
References: <2070261.IvKQ8U6GgO@magrathea> <2877725.qJPT1UHR8W@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Andreas,

I wondered if we could have an agreed set of aliases included in Samba?

I know that would be some duplication, but I see a big advantage in
taking advantage of the per-repo git aliases[1] to ensure everyone
working on Samba has common tools.

That would in turn mean that we can document our processes on the wiki
using the same tools we use, rather than the current 'do what I say,
not what I do' or more charitably 'these are the documented steps, but
Samba wizards do $THIS day-to-day'. 

Things like review and sign-off scripts, Douglas's 'git mr-branch' and
even the 'git autobuild' hook (with the review check) should be set up
standard, just as we set up the commit check for whitespace (which has
done so much for ending whitespace wars!). 

We would need to choose the command names well - they need to make
sense for newbies as well as experienced developers, but this could
make it a little easier for the next new developer. 

Do you think we could collaborate on this?

Thanks,

Andrew Bartlett

[1] http://alblue.bandlem.com/2011/04/git-tip-of-week-aliases.html


On Wed, 2020-06-03 at 16:35 +0200, Andreas Schneider via samba-
technical wrote:
> I've pushed some improvements to the tools ...
> 
> 
> 
> On Tuesday, 24 March 2020 11:00:11 CEST Andreas Schneider via samba-
> technical 
> wrote:
> > Hello,
> > 
> > as a daily task I have to sign commits and also add my review tag
> > after
> > inspection.
> > 
> > As git-filter-branch has been deprecated and the replacement is
> > git-filter-
> > repo [1], I've written some really nice python tools to make my
> > life easier.
> > 
> > In a git repository I and do:
> > 
> > git signoff+            # Add my signoff to commits I authored.
> > git signoff+ --by metze # Sign commits authored by metze,
> >                         # because he forgot :-)
> > git review+             # Add my RB tag to commits I'm not the
> >                         # author of or which has my sign tag
> > git review+ --by metze  # Add review by metze
> > 
> > 
> > metze is a shortcut, the name you specify is actually a file name
> > placed in
> > 
> > ~/.review
> > 
> > so metze is actually the file ~/.review/metze and the content is
> > his name
> > and mail address.
> > 
> > You can find 'git signoff+' at [2] and 'git review+' at [2]. Just
> > put them
> > in
> > 
> > ~/bin/
> > 
> > and git will find them.
> > 
> > 
> > I hope they will be useful to others.
> > 
> > 
> > 
> > 	Andreas
> > 
> > 
> > [1] https://github.com/newren/git-filter-repo/
> > [2]
> > 
https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+
> > [3]
> > 
https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+
> 
> 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




