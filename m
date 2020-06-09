Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E53001F36C5
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 11:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SWoDP2pX9ou0SHi36Sa/KkQPEpxqZMTvDnfmufAodLc=; b=TSUmE+/2FOHI/BBmy1tbJ8/EMs
	byGjCpsTLuHRsdN/bGQ00sukBKmQr/D19GkaxQeTydDw25m++/50FUTHVR/ZbDMqXrKo4giLczBMn
	G5BZp4x0yA6hd8b4EXFw3TkqUgJ4Ojx9/R5LkK7qLVm5M9u5MNxDUSpdkOgWxGA8NIkHqKGssz+Cs
	LnB+1LUbHh1HmITFj7w0YH5sSe4KEjGDb/q542hBbhzIfJUUGEAJre1p+qCdWii4Z0/obItdIk3xL
	TL3l+0WfLENRwNPh7ptwvHRH3+FcPZcKzH/JnOAczNtjOwgXdaJzk/IlAMzxgIdSi1t1h2xAD363f
	njQwCPiQ==;
Received: from localhost ([::1]:33720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiaMY-009agn-BR; Tue, 09 Jun 2020 09:16:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiaMP-009agg-RU
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 09:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=SWoDP2pX9ou0SHi36Sa/KkQPEpxqZMTvDnfmufAodLc=; b=ng17fVYA8BGDBVN/8yr6xKaPWr
 RX0XvkDNaebxryO4SSWGyMP/WiBdklR7I/z+l0xEHhefhfNKtWTAEM8CwOhnxYOxik2D5+vFdi6se
 02eNP1QjksKJYDaKNbcgoe6FyOOILT0d7WFmB5OwhlKRyNwzImPJzZ4RhL2I3zJbhsB6YWpazriyN
 +wgzLF9hPi3uvMpBmFhwlnkqt1u8tGkfLUJW4RFTDRVRtbjmQ57RiibmkEtDU0ZuBS5dWXqi5of7Q
 iQVnqxU5redpNqmdBr5UUWnTo31VBPu8EbFN84gGqO4fz8qQotGlKp5DW923uJ+LNccUJH5Z/HkYq
 aDMvsRurn/KgxCo+GNTMGMhbnGUECCn42TaT9APHW6VmGeAYM/TJTW9rn33hrlWTWsklIn5BBiT3E
 WpZPwRexhlyyQbj4BhyZgiJC6j4PKrq+/3ZMnUkpHbDeIEhOh8r1fB4eFnwgznnNwcQ+gRRE6q62K
 +OGQQzK+SByVj4REXt4DVyma;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiaMO-00014p-74; Tue, 09 Jun 2020 09:15:57 +0000
Message-ID: <2096111bb99eef34a4dccb059ed6eac23ac4ef87.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Karolin Seeger <kseeger@samba.org>, samba-technical@lists.samba.org
Date: Tue, 09 Jun 2020 21:15:52 +1200
In-Reply-To: <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
 <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
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

On Tue, 2020-06-09 at 08:45 +0200, Karolin Seeger via samba-technical
wrote:
> Hi,
> 
> Am 09.06.20 um 01:17 schrieb Christof Schmitt via samba-technical:
> > Hi Andrew,
> > 
> > as Metze wrote, there is still work to be done across tldap and
> > ldb, and
> > probably more questions will come up, which libraries to re-use,
> > how to
> > handle dependencies to those, etc.
> > 
> > For winbindd, the long-tem goal is to improve failover to different
> > domain controllers, in case of network problems or DC outages. The
> > current problem today is that winbindd uses libads, which
> > encapsulates
> > DC selection, LDAP queries and retries in a way that is completely
> > outside of the control of winbindd. So the idea is to move winbindd
> > to
> > tldap first, and then later on move winbindd to be fully async,
> > avoid
> > the child processes and keep the connection state in one place.
> > 
> > The goals to unify the LDAP stacks are worthwhile, but i do not see
> > those as necessary for the winbindd changes. I suspect that would
> > also
> > trigger a wider discussion, e.g. which ASN.1 library to use, how to
> > reprent common data structures, where to put these to handle
> > dependencies.
> 
> I do fully agree on this! Why can't we go ahead with tldap now (which
> is
> used in other places also) to fix the bug and do the re-design later?

I'm sorry, I still hold to my disagreement. 

It is really important to understand that while this will fix bugs, I
don't see this as a bug fix.  This is a lift-and-shift.  These
operations are both delicate and risky.  They also often fix bugs and
introduce important new features.

But this change needs to be evaluated at that, fully aware of the
implications, not just passed in as a bug fix.

I've been involved in implementing and in particular reviewing a large
number of lift-and-shift operations in Samba.  Rarely are they as
simple as they appear, and this one has the added complexity in what
I've raised about the target.

Therefore this cannot be simple regarded as a 'bug fix'.  I'm very
sorry.

Furthermore I've been told that this is actually the culmination of a
significant amount of work over a period of months or even a year.  I'm
incredibly sad that this work got to this late stage before public
discussions allowed these issues became apparent.  

That is awful for everyone, and for that I'm sorry.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




