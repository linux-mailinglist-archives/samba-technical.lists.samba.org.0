Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54A2A6C29
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 18:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+SkP6n0fEMQNoZtAb846fIAlo928WTEGUWzfoK6Yazw=; b=OPCZpinOY+LPEtZUbUojbdlwke
	iTVuuym08LSlWiVvPvDTUt8aXUph1IZcBbGf3JXhji22UznrUhCz7orenpV1T6eHTTsXdqQ4BM2VX
	h3/xDlI4Fgd3FMUmTsiYiwZcKP3G7W/r1YVrASI8iHxZ937MAmakKtLnWLQSPXM+89C9UY0H33vYR
	1KY9W6dwP/b6RHv5gBIhhBjsoHEJYMLGyMi/zMsPRPyJb4qTD/lF2MCCe2E04MyxEnKHFMoktFExS
	rkK7Trwe2DtFwxjO1ULM0Xyj7Rshi9StmSmqyMPHgdQ5YIfJRQ6yFXifbef/XC0BTIZG6fl+Q2uSM
	Ny8VuTtw==;
Received: from ip6-localhost ([::1]:53340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaMu0-00HTtL-CF; Wed, 04 Nov 2020 17:48:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13518) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaMtu-00HTt8-Pi; Wed, 04 Nov 2020 17:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=+SkP6n0fEMQNoZtAb846fIAlo928WTEGUWzfoK6Yazw=; b=Tx1tVoXsLBNQL4Aokf6s0QMvqt
 1XyzOCBdBYfdH/NPcXEEJh1/O7D8bV4oR1DiUwN7S6sl2hxpOZJ6I5BJF8lTmDlqopXOlizQ2Mm4W
 zEYhD6HHYDRoPN4Q0UiytLzlIKGDedjLdVC+DoJvalvhz7D9tLupvBaDGPfskFdIP/OHyQeBiZb5G
 a7PGmxkaeDyeXlB17M/CuZb1Yj+1PRQLt3lDYA4PyFbjRhBzLtPqAi4z0BagpsdlagnUfXgnkev40
 VFyqBayRYrexQ1Ee00ycEojX6gKEeWO8+Bl4lFXr/p8AkpR/cC0kINcx0B7SugcmmCA2DJkvpW3p5
 T6epxdpezCPy+HYSrXXZ2mAOhn44R5L51hMCTCU3v2gGnCiuGtO1iRWKfYp7FPvGri7UeS6PhPUqX
 KvRH/hc1WCpN85pLtLkuQUvAbYLwFUmyVpiuVDjLYikyt1LzRXpg2hEcKAnm8JxlhbWiH9lIsCsMB
 cGNcplKOepTPPS+UzC3PC6MG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaMto-0000wH-S6; Wed, 04 Nov 2020 17:48:45 +0000
Message-ID: <a0015fc8e58211b1885b2fd515f9321296d17d76.camel@samba.org>
Subject: Re: cli_credentials_parse_name... (Re: [SCM] Samba Shared
 Repository - branch master updated)
To: samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>
Date: Thu, 05 Nov 2020 06:48:37 +1300
In-Reply-To: <20201104172320.GA571436@pinega.vda.li>
References: <20201104162403.E338C14012A@sn.samba.org>
 <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
 <20201104172320.GA571436@pinega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
Cc: Andreas Schneider <asn@samba.org>, samba-cvs@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-11-04 at 19:23 +0200, Alexander Bokovoy wrote:
> On ke, 04 marras 2020, Stefan Metzmacher wrote:
> > Am 04.11.20 um 17:24 schrieb Alexander Bokovoy:
> > > The branch, master has been updated
> > >        via  f9016912098 lookup_name: allow lookup for own realm
> > >        via  00f4262ed0b cli_credentials: add a helper to parse
> > > user or group names
> > >        via  eb0474d27ba cli_credentials_parse_string: fix parsing
> > > of principals
> > >       from  a1b021200e3 selftest: add test for new "samba-tool
> > > user unlock" command
> > > 
> > > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > > 
> > > 
> > > - Log ---------------------------------------------------------
> > > --------
> > > commit f901691209867b32c2d7c5c9274eee196f541654
> > > Author: Alexander Bokovoy <ab@samba.org>
> > > Date:   Wed Nov 4 14:21:33 2020 +0200
> > > 
> > >     lookup_name: allow lookup for own realm
> > >     
> > >     When using a security tab in Windows Explorer, a lookup over
> > > a trusted
> > >     forest might come as realm\name instead of NetBIOS domain
> > > name:
> > >     
> > >     -------------------------------------------------------------
> > > -------
> > >     [2020/01/13 11:12:39.859134,  1, pid=33253,
> > > effective(1732401004, 1732401004), real(1732401004, 0),
> > > class=rpc_parse]
> > > ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
> > >            lsa_LookupNames3: struct lsa_LookupNames3
> > >               in: struct lsa_LookupNames3
> > >                   handle                   : *
> > >                       handle: struct policy_handle
> > >                           handle_type              : 0x00000000
> > > (0)
> > >                           uuid                     : 0000000e-
> > > 0000-0000-1c5e-a750e5810000
> > >                   num_names                : 0x00000001 (1)
> > >                   names: ARRAY(1)
> > >                       names: struct lsa_String
> > >                           length                   : 0x001e (30)
> > >                           size                     : 0x0020 (32)
> > >                           string                   : *
> > >                               string                   :
> > > 'ipa.test\admins'
> > >                   sids                     : *
> > >                       sids: struct lsa_TransSidArray3
> > >                           count                    : 0x00000000
> > > (0)
> > >                           sids                     : NULL
> > >                   level                    :
> > > LSA_LOOKUP_NAMES_UPLEVEL_TRUSTS_ONLY2 (6)
> > >                   count                    : *
> > >                       count                    : 0x00000000 (0)
> > >                   lookup_options           :
> > > LSA_LOOKUP_OPTION_SEARCH_ISOLATED_NAMES (0)
> > >                   client_revision          :
> > > LSA_CLIENT_REVISION_2 (2)
> > > 
> > > ...
> > > 
> > > diff --git a/auth/credentials/tests/test_creds.c
> > > b/auth/credentials/tests/test_creds.c
> > > index d2d3d30d73d..38550d6ecf9 100644
> > > --- a/auth/credentials/tests/test_creds.c
> > > +++ b/auth/credentials/tests/test_creds.c
> > > @@ -187,7 +187,7 @@ static void torture_creds_parse_string(void
> > > **state)
> > >  	assert_string_equal(creds->domain, "");
> > >  	assert_int_equal(creds->domain_obtained, CRED_SPECIFIED);
> > >  
> > > -	assert_string_equal(creds->username, "wurst@brot.realm");
> > > +	assert_string_equal(creds->username, "wurst");
> > 
> > I'm sorry but this is wrong!
> > I'm wondering why this wasn't covered by any high level test.
> > 
> > This needs to result in domain="" and username="wurst@brot.realm"
> > and that's exactly what we need to use for NTLMSSP.
> > Also note that "brot.realm" may not be a realm and "wurst" may not
> > be a sAMAccountName. A userPrincipalName can be 
> > anything@anydomain-of-msDS-SPNSuffixes.

cli_credentials_get_ntlm_username_domain() does this already.

> > I fear we need to revert these changes.
> > From the merge request (
> > https://gitlab.com/samba-team/samba/-/merge_requests/1658)
> > I didn't really look at the whole patchset (with behavior change)
> > I only focused on CRED_NO_PASSWORD.
> > 
> > I think we need to logic we have in wb_irpc_lsa_LookupNames4_call()
> > and/or parse_domain_user() here.
> 
> I'm pushing a revert for now and will look at those.

I'm not so sure this is totally wrong.  Can I have a look over these
paths at the office?  I need any possible distraction from US election
results anyway...

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




