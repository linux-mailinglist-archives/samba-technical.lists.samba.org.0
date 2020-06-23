Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E82162046CE
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 03:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZhV2W9a+GVxn1Y9fF2A5tjblQyl0+d1BdsHYINL/ntI=; b=zMNR+r91oMmh6PRq3Fh+Ql7t+z
	kuHPJMRFy1PPu+Ct8E5x1l8zP50+1a65mBzg+vbzxhpbCIUG02praqVWLKNd+eZZcapzcp/ztsN+l
	4aVwCICHw4wj1e4fQLxUGtqU+htJA/4BKT3OaWQzVG+11a0zWDnV4TIbjCD8HIveentiu5vs6dm91
	tQveC8NhofgM5R6jtixp30yEIbOOjkYzHmo2oP59Hh+rJui0XdJnQ3wNwPsLeoUtCkg0uo/IQgvsZ
	YWbB6em7SZpTWs9/1Q5V9WR61A1MSze3fwQ8a41bvwMAUu6ExZqrjaWkhRxvDbUBMLLbmRFV1Srxx
	W7uWbm0g==;
Received: from localhost ([::1]:34566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnXsq-001v83-GP; Tue, 23 Jun 2020 01:37:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnXsi-001v7w-S2
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 01:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ZhV2W9a+GVxn1Y9fF2A5tjblQyl0+d1BdsHYINL/ntI=; b=A4Hbsr3GpQCH0LdE/Gv/6TaARi
 xQsSVEXCJKvwTgo3rsHh8Y03Mn3UELlCYT0/PpOIPTfgASfPxNZPRvUnhDipIyLRz2jRpB14BGbHL
 dd/Cs7C5b5fMpvPn8drtVSg5A6yHTITn5ReU2/8WHbDoJ7Je6erCVvz8Dj65sdR3JysvTYX8KB7zB
 ZuW2XU14m2uXkVyCUy2s6uT9nLXJ2Aka/vvTVpN5DpmMd0kVJIeWzxtGNHeV6496AEBbHYiHpOxkt
 HZyyflfdIUesYSXmzi13OKvnguJDL2/mexVE5omYpNlbk4TLvE0BpKkbgMHh2Pa7Bcky76z4aNqN/
 KHOfPRnNiCfCYTyiCc2uwLaUjmvZ9sr0sCNuSPcu5EBeakhjdK8WFeqE5lCbVmyynr/o5VQebvmY8
 AjrLStSEkpZ2iqb4/XU7aEMtxQnPFxUhcQxecS1BfazYR155tSRZHAGFtg2RDiw79I+4ReGPiaa7l
 BiWXLQpgrzT3S7z7aooHLie3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnXsh-0005oz-DE; Tue, 23 Jun 2020 01:37:48 +0000
Message-ID: <e444558549bb3dede91b551e1c13c3bbdae74847.camel@samba.org>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Isaac Boukris <iboukris@gmail.com>
Date: Tue, 23 Jun 2020 13:37:43 +1200
In-Reply-To: <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
 <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-06-22 at 23:02 +0200, Isaac Boukris wrote:
> On Mon, Jun 22, 2020 at 9:32 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > 
> > Likewise, ldap ssl ads should explain more which operations it
> > applies
> > to (additionally note it doesn't apply to tldap and so idmap_ad as
> > TLS
> > isn't implemented there yet).
> 
> Yeah, I'm still unclear how it relates to and differs from "ldap
> ssl".

"ldap ssl" is about if we should use TLS to protect the LDAP connection
between Samba's pdb_ldap passdb module and the (typically) OpenLDAP
server.  

Sometimes this is over ldapi:// and doesn't matter, but often this will
be a remote (eg organisational central) LDAP server.  Even with local
servers this matters when chasing a referral from the local slave to
the master server to write a password change.

As the AD domain member case is quite different, even if using similar
code, a new option was added.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




