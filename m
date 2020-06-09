Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 970191F466E
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 20:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9T97slGNHmoeGgx0PLuCMubhpqWxEMZcs857jnwwYBM=; b=bGUYOFn8hjq1z0zGeZm4u3iZQy
	OrJ6lBcaqsl8IzS/zM0OyioC6ybW1hqAL5wkhBSljvFuA4nN2U0XBq6PcicY5tlJkFgxvM/0+HS0H
	xSMGfc93wdMz8fBJ6669luE0crKmE45SSDhge8BbLnoQ3kLIwi+CmH8iIKkYKVDMLypeogn1sSWnV
	4c0n+wg15xbEdxOoR/9vkx7mibot7ceS8AtweKPspPwMiMZVaQ+jMQxz36UcuEeLV9kiqqSfl4KP2
	AkqbUHJTXxX3r8KTYYq5E75dLQPRtQSOl38LcInYOjvgpIvDolORX1PW7Xvi5M7xup2a2iriU9Y4J
	t1GxokiA==;
Received: from localhost ([::1]:54060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jijAn-009e4R-SA; Tue, 09 Jun 2020 18:40:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jijAi-009e4K-A3
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 18:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9T97slGNHmoeGgx0PLuCMubhpqWxEMZcs857jnwwYBM=; b=zMMP5r2Iam65di/iI5rIq9H7oS
 GdOeczQRpJ+VYIoOdqUItS9iSwwn3cLJD2LTJw7QCvXIaW3EXUKOsm3EqsLPNyKktjjI+uzVH3WKq
 MI5IK6sfby5uloG30Rl4ClkbjOSmfnyYVpLfBX6IxnaXM9FwSJzRWBOlmfFNPNMY+1PTcGaLO14ta
 TqePLRNMMEvK514KjQnfa/UdlE6RPD+yJ14kNBETnhksCYt4hSuJbBkSYcx+LBoKM+BJ+T3y+INI9
 f16ioVnxM/Ld72CLCLcTC3hZ2+3Vqa8m+ptTqULOBmq+uhhrhR8D5Qj2v8iDboNZHCsig08oa+DgR
 GhRKD0/lUkYntInwqfGGdcF34AaDyODTLDtYZVp0EWw/8+dc0Hzy2ilanxOJDMjI/n1y13eFQ42Qa
 7h7fKQQ4hDIxmLir91WaXz93POronnqw23FWBxOk+j835y9mLXXZQw8e4zBnB1GUyZJasf6cOXWgK
 tQiOXJBO+3CAtRcTXo82AJIy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jijAg-0006Kg-ID; Tue, 09 Jun 2020 18:40:27 +0000
Date: Tue, 9 Jun 2020 11:40:19 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <20200609184019.GB8351@jeremy-acer>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer>
 <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 swen@linux.ibm.com, Christof Schmitt <cs@samba.org>, jra@samba.org,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 22, 2020 at 03:02:29PM +0200, Stefan Metzmacher wrote:
> 
> As you know I like the idea of having things implemented just once!
> But as found out in the past this is a lot of work and
> replacing everything at once is often not possible.
> We learnt that we sometimes have to do small steps with intermediate
> states, which we sometimes not like, but at the same time require
> in order to make progress at all.
> 
> There're a lot of things I'd like to see:
> 1. The ldb api should not be used for pure LDAP users,
>    it's bad enough that the strange async model exists at all!
>    We should hope that it's only used for LDAP for command line
>    tools in a sync fashion.
> 2. source3/lib/tldap_gensec_bind.c should use gensec_update_send/recv
> 3. tldap makes use of the "client ldap sasl wrapping" and other
>    options, which are use by source4/libcli/ldap/ and
>    source3/libads/
> 4. We can add some helpers to get/pass 'struct ldb_message' from/to
>    tldap c.
> 5. users of source4/libcli/ldap/ should move to the tldap api
>    - lib/ldb-samba/ldb_ildap.c can become lib/ldb-samba/ldb_tldap.c
> 6. libads should go away it, at least it's low level internals
>    maybe it can be build on top of tldap as a first step in
>    order to avoid a rewrite of all non-winbind users.
> 7. winbindd should avoid libads and only use tldap.
> 
> But the goal of
> https://gitlab.com/samba-team/samba/-/merge_requests/1351
> is moving along with 7.
> 
> And I'm not seeing why we would require 4, 5, 6 before doing 7.
> They would be nice to have, but they tasks for another day.
> 
> BTW: I'm not saying that I'm happy with the current patchset of merge
> request 1351. But that's a different discussion.

OK, trying to help square this circle by moving the technical
discussion along a bit :-).

Looks to me like the core of the technical dispute is that
source3/lib/tldap.c is duplicating some of the existing
data structures and marshalling/unmarshalling code that
is already being tested with the fuzzing code that already
exists inside ldb.

Here's a good example:

In tldap:

struct tldap_control {
        const char *oid;
        DATA_BLOB value;
        bool critical;
};

marshalled with tldap_push_controls().

In ldb:

struct ldb_control {
        const char *oid;
        int critical;
        void *data;
};

marshalled with ldap_encode_control().

Both of them are doing the same thing (admittedly it's
better to have a ranged pointer via a DATA_BLOB than
an unbounded pointer void *), but call into different
encoding/decoding libraries which are both based on top
of our struct asn1_data library.

We really should be using common marshalling/unmarshalling
calls for things like this so they can be fuzzed and
tested once.

This is (4) part of Metze's comment above.

I agree that (7) is orthoganal to merging the ldap
client libraries, but not quite. The more code that
gets added to winbindd using the tldap structures and
client definitions, the harder the move to common
marshalling will become.

Is there someone on the Team with an iron in this
fire who has the time and motivation to reduce this
duplication so that eventually moving to common
client libraries is less pain ? It's not going to
be able to be me I'm afraid as I have other commitments,
so feel free to tell me to bugger off :-).

Just guessing that would go a long way towards
reducing the conflict in this area. Swen, Christof,
does that seem reasonable to you ?

Jeremy.

